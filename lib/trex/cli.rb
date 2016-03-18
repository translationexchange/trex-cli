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
  class Cli < Trex::Commands::Base

    class << self
      def source_root
        File.expand_path('../../',__FILE__)
      end
    end

    desc 'reset', 'deletes configuration file'
    def reset
      if File.exists?("#{CONFIG_PATH}/config.yml")
        FileUtils.rm("#{CONFIG_PATH}/config.yml")
      end
      say 'Configuration has been removed.'
    end

    map 'tr' => :translate
    desc 'translate', 'translates a label'
    method_option :label, :type => :string, :aliases => '-l', :required => true, :banner => 'label', :default => nil
    method_option :description, :type => :string, :aliases => '-d', :required => false, :banner => 'context', :default => nil
    method_option :tokens, :type => :string, :aliases => '-t', :required => false, :banner => 'tokens', :default => nil
    method_option :options, :type => :string, :aliases => '-o', :required => false, :banner => 'options', :default => nil
    def translate
      say(tr(options[:label], options[:description]))
    end

    desc 'itr', 'starts interactive shell'
    def itr
      help = [
          ['shortcut', 'description'],
          ['\q', 'quit'],
          ['\h', 'help']
      ]

      print_table(help)
      value = ask '->'

      while true do
        opts = value.split(' ')
        # params = opts.size > 1 ? opts[1..-1] : []

        case opts.first
          when '\q'
            return
          when '\h'
            print_table(help)
          else
            say tr(value)
          end

        value = ask '->'
      end
    end

    desc 'rules SUBCOMMAND ...ARGS', 'test and evaluate Tr8n rules'
    subcommand 'rules', Trex::Commands::Rules

    desc 'remote SUBCOMMAND ...ARGS', 'manage which host the applications are located at'
    subcommand 'remote', Trex::Commands::Remote

    desc 'connection SUBCOMMAND ...ARGS', 'manage which database the applications are stored in'
    subcommand 'connection', Trex::Commands::Connection

    desc 'key SUBCOMMAND ...ARGS', 'translation key commands'
    subcommand 'key', Trex::Commands::TranslationKey

    desc 'translator SUBCOMMAND ...ARGS', 'translator commands'
    subcommand 'translator', Trex::Commands::Translator

    desc 'language SUBCOMMAND ...ARGS', 'language commands'
    subcommand 'language', Trex::Commands::Language

    desc 'translation SUBCOMMAND ...ARGS', 'translation commands'
    subcommand 'translation', Trex::Commands::Translation

    desc 'source SUBCOMMAND ...ARGS', 'source commands'
    subcommand 'source', Trex::Commands::Source

    desc 'app SUBCOMMAND ...ARGS', 'project commands'
    subcommand 'project', Trex::Commands::Project

    private

    def tr(label, description = nil, tokens = {}, options = {})
      application(:definition => true).language('ru').translate(label, description, tokens, options)
    end

  end
end
