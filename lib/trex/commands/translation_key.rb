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
    class TranslationKey < Trex::Commands::Base
      namespace :key

      map 's' => :show
      desc 'show KEY', 'Shows translation key'
      def show(key)
        data = application.get('translation_key/index', {:key => key})
        return if data["error"]
        say("Translation key details")
        line

        print_object(data, :columns => [:id, :key, :label, :description, :locale])

        if data['translations']
          say
          say "Translations:"
          line
          paginate(data['translations'])
        end

        say
      end

      map 'd' => :delete
      desc 'delete KEY(S)', 'Deletes translation key. Separate keys with comma.'
      def delete(keys)
        data = http_post('translation_key/delete', {:keys => keys})
        return if data["error"]
        if keys.index(",")
          say("Translation keys have been deleted")
        else
          say("Translation key has been deleted")
        end
      end

      map 'l' => :lookup
      desc 'lookup QUERY', 'Lookup translations for a phrase'
      def lookup(query)
        results = application.get('translation_key/lookup', {:query => query, :limit => 10})

        unless results
          say "No results found"
          return
        end

        if results.size < 10
          say("Found #{results.size} result(s) for search string: \"#{query}\"")
        else
          say("Found many matches for search string: \"#{query}\". Showing first 10 results:")
        end
        say("\n")

        results.each_with_index do |tk, tki|
          line = ["\t", "#{tki+1}: ", "\"#{tk['label']}\""]
          attrs = ["key: #{tk["key"]}"]
          attrs << ["context: #{tk['description']}"] unless tk['description'].nil? or tk['description'].empty?
          line << " (#{attrs.join(', ')})"
          if tk['translations'] and tk['translations'].size > 0
            line << " - #{tk['translations'].size} translation(s)"
          else
            line << " - no translations"
          end
          say(line.join(''))

          if tk['translations']
            tk['translations'].each_with_index do |tr, ti|
              line = ["\t", "\t", "#{ti+1}: "]
              line << "\"#{tr['label']}\""
              line << " (id: #{tr['id']}, locale: #{tr['locale']}, rank: #{tr['rank']})"
              say(line.join(''))
            end
          end

          say("\n")
        end
        say("\n")
      end

      map 'r' => :register
      desc 'register', 'Registers translation key (admins only)'
      method_option :label, :type => :string, :aliases => "-l", :required => false, :banner => "Label of the translation key", :default => nil
      method_option :description, :type => :string, :aliases => "-d", :required => false, :banner => "Description of the translation key", :default => nil
      method_option :source, :type => :string, :aliases => "-s", :required => false, :banner => "Source of the translation key", :default => nil
      def register
        label = options[:label] || ask("Label to be translated: ")
        description = options[:description] || ask("Description (optional): ")
        source = options[:source] || ask("Source of the translation key (optional): ")

        data = application_post('translation_key/register', :source => source, :label => label, :description => description)
        return if error?(data)
        paginate(data["results"], :header => "Translation Keys:")
      end
    end
  end
end