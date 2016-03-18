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

CONFIG_PATH = File.join(ENV['HOME'],'.config','trex')

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
            FileUtils.mkdir_p(CONFIG_PATH)
            template('templates/config.yml', "#{CONFIG_PATH}/config.yml")
          end
          YAML.load(File.read("#{CONFIG_PATH}/config.yml"))
        end
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

      def current_app
        apps[current_config['project']]
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

      def paginate(results, opts = {})
        say
        say(opts[:header]) if opts[:header]
        say

        if results.nil? or results.size == 0
          say('None found')
          return
        end

        opts[:per_page] ||= 50
        opts[:columns]  ||= begin
          if results.first.is_a?(Tr8n::Base)
            keys = []
            results.first.class.attributes.each do |key|
              value = results.first.attributes[key]
              next if value.kind_of?(Tr8n::Base) or value.kind_of?(Hash) or value.kind_of?(Array)
              keys << key
            end
            keys
          else
            results.first.keys.collect{|k| k.to_sym}
          end
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
                if result.is_a?(Tr8n::Base)
                  result.attributes[key]
                else
                  (result[key] || result[key.to_s])
                end
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

        opts[:columns] ||= result.keys.collect{|k| k.to_sym}

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
          table << ["#{title.to_s}: ", (result[key.to_s] || result[key]).to_s]
        end

        print_table(table)

        say(opts[:footer]) if opts[:footer]
        say
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
              'key' => key,
              'url' => settings['url'],
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
