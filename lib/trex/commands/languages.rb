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
    class Languages < Trex::Commands::Base
      namespace :languages

      map 'l' => :list
      desc 'list', 'Lists all languages in Translation Exchange'
      method_option :search, :type => :string, :aliases => '-s', :required => false, :banner => 'search by name', :default => nil
      method_option :per_page, :type => :numeric, :aliases => '-p', :required => false, :banner => 'items per page', :default => 30
      def list
        paginate('v1/languages', {search: options[:search], per_page: options[:per_page]}, {
           :header => "Languages from #{current_config['remote']}:",
           :index => true
        })
        say
      end

      map 's' => :show
      desc 'show', 'Shows information about a language'
      method_option :locale, :type => :string, :aliases => '-l', :required => false, :banner => 'locale to view', :default => nil
      def show
        locale = options[:locale] || ask('What locale would you like to see? ')

        data = get("v1/languages/#{locale}")

        print_object(data, :header => 'Language details:')
      end

    end
  end
end
