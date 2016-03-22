#--
# Copyright (c) 2016 Translation Exchange, Inc.
#
#
#  _______                  _       _   _             ______          _
# |__   __|                | |     | | (_)           |  ____|        | |
#    | |_ __ __ _ _ __  ___| | __ _| |_ _  ___  _ __ | |__  __  _____| |__   __ _ _ __   __ _  ___
#    | | '__/ _` | '_ \/ __| |/ _` | __| |/ _ \| '_ \|  __| \ \/ / __| '_ \ / _` | '_ \ / _` |/ _ \
#    | | | | (_| | | | \__ \ | (_| | |_| | (_) | | | | |____ >  < (__| | | | (_| | | | | (_| |  __/
#    |_|_|  \__,_|_| |_|___/_|\__,_|\__|_|\___/|_| |_|______/_/\_\___|_| |_|\__,_|_| |_|\__, |\___|
#                                                                                        __/ |
#                                                                                       |___/
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

require 'faraday'
require 'pp'
require 'json'
require 'thor'
require 'yaml'
require 'highline'

CONFIG_PATH = File.join(ENV['HOME'], '.config', 'trex')

module Trex
  module Commands
    class Base < Thor
      include Thor::Actions

      protected

      def line
        say '-' * 20
      end

      def config
        @config ||= begin
          unless File.exists?("#{CONFIG_PATH}/config.yml")
            self.class.source_root(File.join(__dir__, '..', 'templates'))
            FileUtils.mkdir_p(CONFIG_PATH)
            template('config.yml', "#{CONFIG_PATH}/config.yml")
          end
          YAML.load(File.read("#{CONFIG_PATH}/config.yml"))
        end
      end

      def api(path, params = {}, opts = {})
        host = opts[:host]
        host ||= current_remote['api']['host'] if current_remote
        method = opts[:method] || :get

        if current_remote
          params = params.merge(access_token: current_remote['access_token'])
        end

        # pp "#{method} #{host}/#{path}"
        conn = Faraday.new(:url => host) do |faraday|
          faraday.request(:url_encoded) # form-encode POST params
          faraday.adapter(Faraday.default_adapter) # make requests with Net::HTTP
        end

        if method == :get
          response = conn.get(path, params)
        elsif method == :post
          response = conn.post(path, params)
        elsif method == :put
          response = conn.put(path, params)
        elsif method == :delete
          response = conn.delete(path, params)
        else
          raise "Unsupported API method #{method}"
        end

        data = response.body

        begin
          unless data.nil? or data == ''
            data = JSON.parse(data)
          end
        rescue Exception => ex
          abort("Could not parse API response #{ex.message}")
        end

        if [402, 403, 500].include?(response.status)
          if data.is_a?(Hash)
            if data['msg']
              abort("Error: #{data['msg']}")
            elsif data['error']
              abort("Error: #{data['error']}")
            end
          else
            abort('API Error')
          end
        end

        # pp data

        data
      end

      def get(path, params = {}, opts = {})
        api(path, params, opts.merge(:method => :get))
      end

      def post(path, params = {}, opts = {})
        api(path, params, opts.merge(:method => :post))
      end

      def put(path, params = {}, opts = {})
        api(path, params, opts.merge(:method => :put))
      end

      def delete(path, params = {}, opts = {})
        api(path, params, opts.merge(:method => :delete))
      end

      def update_config
        File.open("#{CONFIG_PATH}/config.yml", 'w') do |f|
          f.write(config.to_yaml)
        end
      end

      def remotes
        config['remotes'] ||= {}
      end

      def connections
        config['connections'] ||= {}
      end

      def projects
        config['projects'] ||= {}
      end

      def current_config
        config['current']
      end

      def current_remote
        remotes[current_config['remote']]
      end

      def project_selected?
        !current_config['project'].nil? and !current_config['project']['key'].nil? and !current_config['project']['key'].empty?
      end

      def ensure_project_selected
        unless project_selected?
          abort('Please select a project first')
        end
      end

      def current_project_key
        current_config['project']['key']
      end

      def current_project_name
        current_config['project']['name']
      end

      def source_selected?
        !current_config['source'].nil? and !current_config['source']['id'].nil?
      end

      def ensure_source_selected
        unless source_selected?
          abort('Please select a project source first')
        end
      end

      def current_source_id
        current_config['source']['id']
      end

      def current_source_name
        current_config['source']['source']
      end

      def application(opts = {})
        key = opts[:project] || current_config['project']
        @projects ||= {}
        @projects[key] ||= begin
          app = apps[key]
          remote = remotes[app['remote']]
          app = Tml::Application.new(:host => remote['api']['host'], :key => app['key'], :access_token => app['access_token'])
          app.fetch if opts[:definition]
          app
        end
      end

      def user
        @user ||= application.api_client.get('users/me')
      end

      def translator
        @translator ||= user['translator']
      end

      def access_token(opts = {})
        remote = opts[:remote] ? remotes[opts['remote']] : current_remote
        remote['access_token']
      end

      def error?(data)
        not data['error'].nil?
      end

      def paginate(path, params = {}, opts = {})
        say
        say(opts[:header]) if opts[:header]
        say

        data = get(path, params)
        results = data['results']
        pagination = data['pagination']

        if results.nil? or results.size == 0
          say('None found')
          return
        end

        index = 0

        all_results = []
        while pagination['total_pages'] >= pagination['current_page']
          opts[:columns] ||= results.first.keys.collect { |k| k.to_sym }

          table = []
          titles = []
          unless opts[:skip_title]
            if opts[:index] or opts[:select]
              titles << ''
            end

            opts[:columns].each do |column|
              width = nil
              title = column
              explicit = false

              if column.is_a?(Array)
                title = column.last
              elsif column.is_a?(Hash)
                title = column[:title] || column[:key]
                width = column[:width]
                explicit = true
              end

              title = title.to_s

              unless explicit
                title = title.split('.').last
              end

              if width
                if title.length > width
                  title = title[0..(width-3)] + '...'
                else
                  title += ' ' * (width - title.length)
                end
              end

              titles << title
            end
            table << titles
          end

          results.each do |result|
            row = []
            if opts[:index] or opts[:select]
              index += 1
              row << "  #{index}:  "
            end
            opts[:columns].each do |column|
              key = column
              width = nil

              if column.is_a?(Array)
                key = column.first
              elsif column.is_a?(Hash)
                key = column[:key]
                width = column[:width]
              end

              key = key.to_s.split('.')
              value = result[key[0]]
              key[1..-1].each do |sub_key|
                value = value[sub_key]
              end

              if width
                if value.length > width
                  value = value[0..(width-3)] + '...'
                else
                  value += ' ' * (width - value.length)
                end
              end

              row << value
            end
            all_results << result
            table << row
          end
          print_table(table)

          data = get(path, params.merge(page: pagination['current_page'] + 1))
          results = data['results']
          pagination = data['pagination']

          if opts[:select]
            if pagination['total_pages'] > pagination['current_page']
              selected_index = ask('Enter the index or press enter to view more results: ')
            else
              selected_index = ask('Enter the index:')
            end
            say
            if selected_index.match(/\d+/)
              return all_results[selected_index.to_i - 1]
            end
          else
            if pagination['total_pages'] >= pagination['current_page']
              ask("Showing page #{pagination['current_page']-1} of #{pagination['total_pages']}. Press enter to view the next page...")
              say
            end
          end
        end

        say(opts[:footer]) if opts[:footer]
        say
        nil
      end

      def print_objects(results, opts = {})
        say
        say(opts[:header]) if opts[:header]
        say

        if results.nil? or results.size == 0
          say('None found')
          return
        end

        opts[:per_page] ||= 50
        opts[:columns]  ||= begin
          results.first.keys.collect{|k| k.to_sym}
        end

        page = 0
        while true
          table = []
          titles = []
          unless opts[:skip_title]
            if opts[:with_numbers]
              titles << ""
            end

            opts[:columns].each do |c|
              if c.is_a?(Symbol)
                titles << c.to_s
              elsif c.is_a?(Array)
                titles << c.last.to_s
              elsif c.is_a?(Hash)
                titles << c[:title].to_s
              else
                say('Invalid pagination call...')
                return
              end
            end
            table << titles
          end

          start_index = page * opts[:per_page]
          end_index = start_index + opts[:per_page] - 1

          results[start_index..end_index].each_with_index do |result, index|
            row = []
            if opts[:with_numbers]
              row << "  #{start_index + index + 1}:  "
            end
            opts[:columns].each do |c|
              if c.is_a?(Symbol)
                key = c
              elsif c.is_a?(Array)
                key = c.first
              elsif c.is_a?(Hash)
                key = c[:key]
              else
                say('Invalid pagination call...')
                return
              end
              row << begin
                (result[key] || result[key.to_s])
              end
            end
            table << row
          end
          print_table(table)

          if results.size <= end_index
            break
          else
            page += 1
            say
            ask('Press enter to view more results...')
          end
        end

        say(opts[:footer]) if opts[:footer]
        say
      end

      def print_object(result, opts = {})
        say(opts[:header]) if opts[:header]
        say

        opts[:columns] ||= result.keys.collect { |k| k.to_sym }

        table = []

        opts[:columns].each do |c|
          if c.is_a?(Symbol)
            title = c
            key = c
          elsif c.is_a?(Array)
            title = c.last
            key = c.first
          elsif c.is_a?(Hash)
            title = c[:title]
            key = c[:key]
          else
            say('Invalid show call...')
            return
          end
          value = result[key.to_s] || result[key]
          if value.is_a?(Hash)
            value = value.to_json
          end
          table << ["#{title.to_s}: ", value.to_s]
        end

        print_table(table)

        say(opts[:footer]) if opts[:footer]
        say
      end

      def ask_for_password(message)
        HighLine.new.ask(message) do |q|
          q.echo = false
        end
      end

      def ask_for_number(max, opts = {})
        opts[:message] ||= 'Choose: '
        while true
          value = ask(opts[:message])
          if /^[\d]+$/ === value
            num = value.to_i
            if num < 1 or num > max
              say('Hah?')
            else
              return num
            end
          else
            say('Hah?')
          end
        end
      end

      def connection_list
        @connection_list ||= begin
          data = []
          connections.each do |key, settings|
            data << {
                'key' => key,
                'url' => settings['url'],
                'username' => settings['username'],
            }
          end
          data
        end
      end

      def remote_list
        @remote_list ||= begin
          data = []
          remotes.each do |key, settings|
            data << {
                'env' => key,
                'api' => settings['api']['host'],
                'gateway' => settings['gateway']['host'],
            }
          end
          data
        end
      end

      def project_list
        @project_list ||= begin
          data = []
          projects.each do |key, settings|
            data << {
                'key' => key,
                'remote' => settings['remote'],
                'name' => settings['name'],
                'client_id' => settings['client_id'],
                'authorized?' => !settings['access_token'].nil?,
            }
          end
          data
        end
      end
    end
  end
end
