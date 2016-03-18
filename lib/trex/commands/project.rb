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
      namespace :app

      map 'a' => :add
      desc 'add', 'adds a project'
      method_option :name, :type => :string, :aliases => "-n", :required => false, :banner => "application configuration name (for reference)", :default => nil
      method_option :remote, :type => :string, :aliases => "-r", :required => false, :banner => "remote name", :default => nil
      method_option :key, :type => :string, :aliases => "-k", :required => false, :banner => "application remote key", :default => nil
      method_option :secret, :type => :string, :aliases => "-s", :required => false, :banner => "application remote secret", :default => nil
      def add
        say("Please provide the following information to add a new application configuration:")
        name = options[:name] || ask("What is the name of this application configuration? ")

        remote = options[:remote] || begin
          say("Where is the application running? ")
          paginate(remote_list, {
              :header => "Tr8n services:",
              :with_numbers => true
          })
          value = ask_for_number(remote_list.size)
          remote_list[value-1]['key']
        end

        client_id = options[:key] || ask("Application key: ")
        client_secret = options[:secret] || ask("Application secret: ")

        say("Authorizing application...")
        app = Tml::Application.new(host: remotes[remote]['url'], key: client_id, secret: client_secret)
        app.fetch

        apps[name] = {
            "remote" => remote,
            "client_id" => client_id,
            "client_secret" => client_secret,
            "name" => app.name,
            "access_token" => app.access_token
        }

        if yes?("Would you like to set it as the default application? (Y/n)")
          current_config["app"] = name
        end

        update_config

        say("Configuration has been updated")
      end

      map 'p' => :ping
      desc 'ping', 'checks if the service is running'
      method_option :app, :type => :string, :aliases => "-a", :required => false, :banner => "application key", :default => nil
      def ping
        key = options[:app] || current_config["app"]
        data = application(:app => key).api_client.get("proxy/ping")
        say

        unless data and data["status"]
          say("Application \"#{key}\" is not responding")
        else
          say("Application \"#{key}\" running at [#{application.host}] is responding: #{data["status"]}")
        end
        say
      end

      map 'd' => :default
      desc 'default', 'displays the default app'
      def default
        print_object(application(:definition => true).to_hash, :header => "Default app:")

        return unless yes?("Would you like to switch to a different application? (y/N)")

        paginate(app_list, {
            :header => "Application configurations:",
            :with_numbers => true
        })

        say("Which application would you like to set as default?")
        value = ask_for_number(app_list.size)
        app = app_list[value-1]
        current_config["app"] = app['key']
        update_config
        say
        say("The default app has been changed to #{app['key']}")
        say
      end

      map 'l' => :list
      desc 'list', 'lists all apps and allows you to switch between them'
      def list
        paginate(app_list, {
            :header => "Applications:",
            :with_numbers => true
        })
        say
      end

      map 'r' => :remove
      desc 'remove', 'removes an application configuration'
      def remove
        paginate(app_list, {
            :header => "Applications:",
            :with_numbers => true
        })

        say("Which application would you like to remove?")
        value = ask_for_number(app_list.size)
        app = app_list[value-1]
        apps.delete(app['key'])
        update_config

        say("The app #{app['key']} has been removed")
        say
      end

      desc 'languages', 'lists all languages for the current application'
      method_option :app, :type => :string, :aliases => "-a", :required => false, :banner => "application key", :default => nil
      def languages
        key = options[:app] || current_config["app"]
        paginate(application(:app => key, :definition => true).languages, :header => "Application languages:", :with_numbers => true)
      end

      desc 'sources', 'lists all sources for the current application'
      method_option :app, :type => :string, :aliases => "-a", :required => false, :banner => "application key", :default => nil
      def sources
        key = options[:app] || current_config["app"]
        paginate(application(:app => key, :definition => true).sources, :header => "Application sources:")
      end

      desc 'components', 'lists all components for the current application'
      method_option :app, :type => :string, :aliases => "-a", :required => false, :banner => "application key", :default => nil
      def components
        key = options[:app] || current_config["app"]
        paginate(application(:app => key, :definition => true).components, :header => "Application components:", :with_numbers => true)
      end

      desc 'translators', 'lists all translators for the current application'
      method_option :app, :type => :string, :aliases => "-a", :required => false, :banner => "application key", :default => nil
      def translators
        key = options[:app] || current_config["app"]
        paginate(application(:app => key, :definition => true).translators, :header => "Application translators:", :with_numbers => true)
      end

      desc 'migrate', 'migrates translations from one application to another'
      method_option :source, :type => :string, :aliases => "-s", :required => true, :banner => "source application", :default => nil
      method_option :target, :type => :string, :aliases => "-t", :required => true, :banner => "target application", :default => nil
      def migrate
        task = Trex::Tasks::Migration.new(application(:key => options[:source]), application(:key => options[:target], :definition => true))
        task.run
      end

      desc 'import', 'imports data from a specific database to the hosted service'
      method_option :app, :type => :string, :aliases => "-a", :required => false, :banner => "application key", :default => nil
      method_option :source, :type => :string, :aliases => "-s", :required => true, :banner => "source connection", :default => nil
      method_option :target, :type => :string, :aliases => "-t", :required => true, :banner => "target connection", :default => nil
      def import
        key = options[:app] || current_config["app"]
        source = connections[options[:source]]
        target = connections[options[:target]]
        task = Trex::Tasks::Import.new(application(:app => key), source, target)
        task.run
      end

    end
  end
end
