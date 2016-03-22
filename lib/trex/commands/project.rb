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

module Trex
  module Commands
    class Project < Trex::Commands::Base
      namespace :project

      map 'l' => :index
      desc 'list', 'Lists all apps and allows you to switch between them'
      method_option :search, :type => :string, :aliases => '-s', :required => false, :banner => 'search by name', :default => nil
      method_option :per_page, :type => :numeric, :aliases => '-p', :required => false, :banner => 'items per page', :default => 30
      def list
        paginate('v1/users/me/projects', {search: options[:search], per_page: options[:per_page]}, {
           :header => "Projects from #{current_config['remote']}:",
           :index => true,
           :columns => [:id, :type, :key, :name, :description, :published_state, :default_locale]
        })
        say
      end

      # map 'a' => :add
      # desc 'add', 'adds a project'
      # method_option :name, :type => :string, :aliases => "-n", :required => false, :banner => "application configuration name (for reference)", :default => nil
      # method_option :remote, :type => :string, :aliases => "-r", :required => false, :banner => "remote name", :default => nil
      # method_option :key, :type => :string, :aliases => "-k", :required => false, :banner => "application remote key", :default => nil
      # method_option :secret, :type => :string, :aliases => "-s", :required => false, :banner => "application remote secret", :default => nil
      # def add
      #   say('Please provide the following information to add a new application configuration:')
      #   name = options[:name] || ask('What is the name of this application configuration? ')
      #
      #   remote = options[:remote] || begin
      #     say('Where is the application running? ')
      #     paginate(remote_list, {
      #         :header => "Tr8n services:",
      #         :with_numbers => true
      #     })
      #     value = ask_for_number(remote_list.size)
      #     remote_list[value-1]['key']
      #   end
      #
      #   client_id = options[:key] || ask('Project key: ')
      #
      #   say('Authorizing application...')
      #   app = Tml::Application.new(host: remotes[remote]['url'], key: client_id, secret: client_secret)
      #   app.fetch
      #
      #   apps[name] = {
      #       "remote" => remote,
      #       "key" => client_id,
      #       "name" => app.name,
      #       "access_token" => app.access_token
      #   }
      #
      #   if yes?("Would you like to set it as the default application? (Y/n)")
      #     current_config["app"] = name
      #   end
      #
      #   update_config
      #
      #   say("Configuration has been updated")
      # end

      map 's' => :select
      desc 'select', 'Makes the project current'
      method_option :search, :type => :string, :aliases => '-s', :required => false, :banner => 'search by name', :default => nil
      method_option :per_page, :type => :numeric, :aliases => '-p', :required => false, :banner => 'items per page', :default => 30
      def select
        project = paginate('v1/users/me/projects', {search: options[:search], per_page: options[:per_page]}, {
           :header => "Projects from #{current_config['remote']}:",
           :select => true,
           :columns => [:id, :type, :key, :name, :description, :published_state, :default_locale],
        })
        say

        unless project
          abort('No projects found')
        end

        current_config['project'] = {'key' => project['key'], 'name' => project['name'], 'remote' => current_config['remote']}
        update_config

        say
        say("You are now working on #{current_config['project']['name']}")
        say
      end

      map 'c' => :current
      desc 'current', 'Displays the current project'
      def current
        ensure_project_selected
        print_object(get("v1/projects/#{current_project_key}"))
      end

      map 'i' => :import
      desc 'import', 'Imports translation keys from a specific file or path'
      method_option :path, :type => :string, :aliases => '-p', :required => true, :banner => 'Path where to start scanning for tr method references', :default => nil
      def import
        ensure_project_selected
        Scanners::Base.scan(self, options[:path])
      end

      desc 'translator SUBCOMMAND ...ARGS', 'Project translator commands'
      subcommand 'translator', Trex::Commands::ProjectTranslator

      desc 'language SUBCOMMAND ...ARGS', 'Project language commands'
      subcommand 'language', Trex::Commands::ProjectLanguage

      desc 'translation_key SUBCOMMAND ...ARGS', 'Project translation key commands'
      subcommand 'translation_key', Trex::Commands::ProjectTranslationKey

      desc 'translation SUBCOMMAND ...ARGS', 'Project translation commands'
      subcommand 'translation', Trex::Commands::ProjectTranslation

      desc 'source SUBCOMMAND ...ARGS', 'Project source commands'
      subcommand 'source', Trex::Commands::Source

      desc 'request SUBCOMMAND ...ARGS', 'Project request commands'
      subcommand 'request', Trex::Commands::Request

    end
  end
end
