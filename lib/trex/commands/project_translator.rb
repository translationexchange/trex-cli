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
    class ProjectTranslator < Trex::Commands::Base
      namespace :translator

      map 'l' => :list
      desc 'list', 'Lists all translators for the current project'
      def list
        ensure_project_selected

        paginate("v1/projects/#{current_project_key}/translators", {}, {
           :header => "#{current_project_name} translators:",
           :index => true,
           :columns => [:id, 'translator.user_id', 'translator.email', 'translator.display_name', 'translator.rank', :created_at, :updated_at]
        })
      end

      map 'i' => :invite
      desc 'invite', 'Invites a translator'
      method_option :emails, :type => :string, :aliases => '-e', :required => false, :banner => 'emails of the translators to be invited', :default => nil
      method_option :message, :type => :string, :aliases => '-m', :required => false, :banner => 'message to the translators', :default => ''
      method_option :role, :type => :string, :aliases => '-r', :required => false, :banner => 'role of the translator', :default => 'translator'
      def invite
        ensure_project_selected

        emails = options[:emails] || ask('What is the email of the translator you would like to invite? ')

        post("v1/projects/#{current_project_key}/requests", {emails: emails, type: 'invite', role: options[:role], message: options[:message]})

        say("The following emails have been invited: #{emails}")
      end

      map 'r' => :remove
      desc 'remove', 'Removes translator from the project'
      method_option :id, :type => :string, :aliases => '-i', :required => false, :banner => 'project translator id to be removed', :default => nil
      def remove
        ensure_project_selected

        id = options[:id] || ask('What is the id of the project translator record you would like to remove? ')

        delete("v1/projects/#{current_project_key}/translators/#{id}")

        say("Translator '#{id}' has been removed")
        list
      end
    end
  end
end
