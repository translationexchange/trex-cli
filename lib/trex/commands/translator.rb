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
    class Translator < Trex::Commands::Base
      namespace :translator

      desc 'whoami', 'tells you who you are'
      def whoami
        if current_config["access_token"].nil?
          say("You are not currently logged in as a translator.")
          return
        end

        print_object(translator.to_hash, :header => "Your info:")
      end

      map 'a' => :apps
      desc 'apps', 'lists all apps for the translator'
      def apps
        apps = translator.applications.collect{|app|
          app.to_hash
        }

        paginate(apps, {
            :header => "Translator applications:",
            :with_numbers => true
        })

        say
        # value = ask_for_number(apps.size)
        # app = apps[value-1]
        # config["remote"]["app_key"] = app["key"]
        # update_config
        # say "Configuration has been updated."
      end

      desc 'login', 'logs in as a translator to a specific application'
      method_option :app, :type => :string, :aliases => "-a", :required => false, :banner => "application key", :default => nil
      method_option :email, :type => :string, :aliases => "-u", :required => false, :banner => "email address", :default => nil
      method_option :password, :type => :string, :aliases => "-p", :required => false, :banner => "password", :default => nil
      def login
        remote_key = options[:app]
        unless remote_key
          list = remote_list
          if list.size > 1
            paginate(list, {
                :header => "Tr8n Remotes:",
                :with_numbers => true
            })
            say

            say("Which remote would you like to login to?")
            value = ask_for_number(list.size)
            remote_key = list[value-1]['key']
          else
            remote_key = list.first['key']
          end
        end

        current_config["remote"] = remote_key

        email = options[:email] || ask("Email address:")
        password = options[:password] || ask("Password:")

        translator = Tr8n::Translator.authorize(application, email, password)

        current_remote["access_token"] = translator.access_token

        update_config

        print_object(translator.to_hash, :header => "Your info:")

        say "You have been authorized."
      end

      desc 'logout', 'Logs out from the service and deletes access token'
      def logout
        current_remote["access_token"] = ""
        update_config

        say "You have been logged out."
      end
    end
  end
end