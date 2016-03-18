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
    class Source < Trex::Commands::Base
      namespace :source

      map 's' => :show
      desc 'show SOURCE', 'shows application source'
      def show(source)
        data = application.get('source/index', :source => source)
        return if error?(data)
        print_object(data, :header => "Source details:")
      end

      map 'r' => :register
      desc 'register SOURCE', 'registers application source (admins only)'
      def register(source)
        data = application.post('source/register', :source => source)
        return if error?(data)
        print_object(data, :header => "Source details:")
      end

      map 'k' => :keys
      desc 'keys SOURCE', 'finds all keys used in a source'
      def keys(source)
        data = application.get('source/translation_keys', :source => source)
        return if error?(data)
        paginate(data["results"], :header => "Source keys:")
      end

      map 'r' => :reset
      desc 'reset SOURCE', 'disassociates all keys from the source. Load the page again to reassociate valid keys back.'
      def reset(source)
        data = application.post('source/reset', :source => source)
        return if error?(data)
        say("The source has been reset")
      end

      map 'd' => :delete
      desc 'delete SOURCE', 'deletes source.'
      def delete(source)
        data = application.post('source/delete', :source => source)
        return if error?(data)
        say("The source has been deleted")
      end
    end
  end
end
