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
    class Connection < Trex::Commands::Base
      namespace :connection

      map 'a' => :add
      desc 'add', 'Adds a database connection'
      method_option :name, :type => :string, :aliases => '-n', :required => false, :banner => 'connection name', :default => nil
      method_option :url, :type => :string, :aliases => '-d', :required => false, :banner => 'DBI connection url ("DBI:Pg:translations")', :default => nil
      method_option :username, :type => :string, :aliases => '-u', :required => false, :banner => 'username', :default => nil
      method_option :password, :type => :string, :aliases => '-p', :required => false, :banner => 'password', :default => nil
      def add
        say('Please provide the following information for setting up a database connection:')
        name = options[:name] || ask('What is the name of this connection? ')

        unless connections[name].nil?
          return unless yes?('This connection already exists, would you like to overwrite it? (Y/n)')
        end

        url = options[:url] || ask('Connection URL (example: DBI:Pg:translations): ')
        username = options[:username] || ask('Username: ')
        password = options[:password] || ask('Password: ')

        connections[name] = {
            'url' => url,
            'username' => username,
            'password' => password,
        }

        update_config

        say('Configuration has been updated')
      end

      map 'l' => :list
      desc 'list', 'Lists all configured database connections'
      def list
        paginate(connection_list, {
            :header => 'Database Connections:',
            :with_numbers => true
        })
        say
      end

      map 'r' => :remove
      desc 'remove', 'Removes a database connection'
      def remove
        paginate(connection_list, {
            :header => 'Connections:',
            :with_numbers => true
        })

        say('Which connection would you like to remove?')
        value = ask_for_number(connection_list.size)
        conn = connection_list[value-1]
        connections.delete(conn['key'])
        update_config

        say('The connection has been removed')
        say
      end
    end
  end
end
