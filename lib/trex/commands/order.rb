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
    class Order < Trex::Commands::Base
      namespace :order

      map 'l' => :list
      desc 'list', 'Lists all current orders for the current project'
      method_option :search, :type => :string, :aliases => '-s', :required => false, :banner => 'search by name', :default => nil
      method_option :per_page, :type => :numeric, :aliases => '-p', :required => false, :banner => 'items per page', :default => 30
      def list
        ensure_project_selected

        paginate("v1/projects/#{current_project_key}/orders", {search: options[:search], per_page: options[:per_page]}, {
          :header => "#{current_project_name} orders:",
          :index => true,
          # :columns => [:id, :key, :type, :source, :state, :created_at, :updated_at]
        })
      end

      # map 's' => :select
      # desc 'select', 'Makes the order current'
      # method_option :search, :type => :string, :aliases => '-s', :required => false, :banner => 'search by name', :default => nil
      # method_option :per_page, :type => :numeric, :aliases => '-p', :required => false, :banner => 'items per page', :default => 30
      # def select
      #   source = paginate("v1/projects/#{current_project_key}/orders", {search: options[:search], per_page: options[:per_page]}, {
      #      :header => "#{current_project_name} orders:",
      #      :select => true,
      #      :columns => [:id, :key, :type, :source, :state, :created_at, :updated_at]
      #   })
      #   say
      #
      #   unless source
      #     abort('No orders found')
      #   end
      #
      #   current_config['source'] = {
      #       'id' => source['id'],
      #       'key' => source['key'],
      #       'source' => source['source'],
      #       'project' => current_config['project']['key'],
      #       'remote' => current_config['remote']
      #   }
      #   update_config
      #
      #   say
      #   say("You are now working on #{current_config['source']['source']} under #{current_config['project']['name']}")
      #   say
      # end

      # map 'c' => :current
      # desc 'current', 'Displays the current order'
      # def current
      #   ensure_source_selected
      #   print_object(get("v1/orders/#{current_source_id}"),
      #      header: "#{current_project_name} source #{current_source_name}:",
      #      columns: [:id, :type, :key, :source, :key_count, :created_at, :updated_at]
      #   )
      # end

    end
  end
end
