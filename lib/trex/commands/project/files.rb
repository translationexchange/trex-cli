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
    module Project
      class Files < Trex::Commands::Base
        namespace :files

        map 'l' => :list
        desc 'list', 'Lists all files for the current project'
        def list
          ensure_project_selected

          paginate("v1/projects/#{current_project_key}/files", {}, {
             :header => "#{current_project_name} files:",
             :index => true,
             :columns => [:id, :state, :url, :name, :locale, :key_count, :translation_count, :file_size, :created_at, :updated_at]
           })
        end

        map 'd' => :download
        desc 'download', 'Downloads selected file'
        method_option :destination, :type => :string, :aliases => '-d', :required => false, :banner => 'where to store the file', :default => nil
        def download
          ensure_project_selected

          file = paginate("v1/projects/#{current_project_key}/files", {}, {
             :header => "#{current_project_name} files:",
             :select => true,
             :columns => [:id, :state, :url, :name, :locale, :key_count, :translation_count, :file_size, :created_at, :updated_at]
          })

          unless file
            abort('No files found')
          end

          destination = options[:destionation] || ask('Where would you like to store the file (leave blank to store in the current folder): ')

          if destination.to_s == ''
            destination = "./#{file['name']}"
          elsif destination.match(/\/$/)
            destination += file['name']
          end

          data = open(file['url']).read

          File.open(destination, 'w') do |file|
            file.write(data)
          end

          say("File \"#{file['name']}\" has been store in #{destination}")
        end

        map 'u' => :upload
        desc 'upload', 'Uploads a file'
        method_option :source, :type => :string, :aliases => '-s', :required => false, :banner => 'which file to upload', :default => nil
        def upload
          ensure_project_selected

        end

      end
    end
  end
end

