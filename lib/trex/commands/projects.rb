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
    class Projects < Trex::Commands::Base
      namespace :projects

      map 'l' => :list
      desc 'list', 'Lists all apps and allows you to switch between them'
      method_option :search, :type => :string, :aliases => '-s', :required => false, :banner => 'search by name', :default => nil
      method_option :per_page, :type => :numeric, :aliases => '-p', :required => false, :banner => 'items per page', :default => 30
      def list
        paginate('v1/users/me/projects', {search: options[:search], per_page: options[:per_page]}, {
           :header => "Projects from #{current_config['remote']}:",
           :index => true,
           :columns => [:id, :type, :key, :permalink, :name, :description, :published_state, :default_locale]
        })
        say
      end

      map 'a' => :add
      desc 'add', 'Adds a new project'
      method_option :type, :type => :string, :aliases => '-t', :required => false, :banner => 'project type', :default => 'web'
      method_option :name, :type => :string, :aliases => '-n', :required => true, :banner => 'project name', :default => nil
      method_option :locale, :type => :string, :aliases => '-l', :required => false, :banner => 'default locale', :default => 'en'
      method_option :url, :type => :string, :aliases => '-u', :required => false, :banner => 'default locale', :default => nil
      def add
        name = options[:name] || ask('What is the name of this new project? ')

        data = post('v1/projects', {name: name, type: options[:type], url: options[:url]})

        current_config['project'] = {'key' => data['key'], 'name' => data['name'], 'remote' => current_config['remote']}
        update_config

        say
        say("You are now working on #{current_config['project']['name']}")
        say
      end

      map 's' => :select
      desc 'select', 'Makes the project current'
      method_option :search, :type => :string, :aliases => '-s', :required => false, :banner => 'search by name', :default => nil
      method_option :per_page, :type => :numeric, :aliases => '-p', :required => false, :banner => 'items per page', :default => 30
      def select
        project = paginate('v1/users/me/projects', {search: options[:search], per_page: options[:per_page]}, {
           :header => "Projects from #{current_config['remote']}:",
           :select => true,
           :columns => [:id, :type, :key, :permalink, :name, :description, :published_state, :default_locale],
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

      map 'x' => :extract
      desc 'extract', 'Extracts translation keys from a specific file or path'
      method_option :source, :type => :string, :aliases => '-s', :required => true, :banner => 'File or directory path', :default => nil
      method_option :destination, :type => :string, :aliases => '-d', :required => false, :banner => 'Path for extracted files', :default => nil
      method_option :grammar, :type => :string, :aliases => '-g', :required => false, :banner => 'Grammar file path', :default => nil
      def extract
        # ensure_project_selected
        Extractors::Base.extract(self, options[:source], options[:destination], options[:grammar])
      end

      desc 'translators SUBCOMMAND ...ARGS', 'Project translator commands'
      subcommand 'translators', Trex::Commands::Project::Translators

      desc 'languages SUBCOMMAND ...ARGS', 'Project language commands'
      subcommand 'languages', Trex::Commands::Project::Languages

      desc 'translation_keys SUBCOMMAND ...ARGS', 'Project translation key commands'
      subcommand 'translation_keys', Trex::Commands::Project::TranslationKeys

      desc 'translations SUBCOMMAND ...ARGS', 'Project translation commands'
      subcommand 'translations', Trex::Commands::Project::Translations

      desc 'sources SUBCOMMAND ...ARGS', 'Project source commands'
      subcommand 'sources', Trex::Commands::Project::Sources

      desc 'requests SUBCOMMAND ...ARGS', 'Project request commands'
      subcommand 'requests', Trex::Commands::Project::Requests

      desc 'orders SUBCOMMAND ...ARGS', 'Project order commands'
      subcommand 'orders', Trex::Commands::Project::Orders

      desc 'files SUBCOMMAND ...ARGS', 'Project file commands'
      subcommand 'files', Trex::Commands::Project::Files

    end
  end
end
