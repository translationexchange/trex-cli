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

    desc 'login', 'Authorizes user with a remote service'
    method_option :env, :type => :string, :aliases => '-h', :required => false, :banner => 'environment', :default => nil
    method_option :email, :type => :string, :aliases => '-e', :required => false, :banner => 'email', :default => nil
    method_option :password, :type => :string, :aliases => '-p', :required => false, :banner => 'password', :default => nil
    def login
      env = options[:env] || begin
        say('Which host would you like to authorize?')
        print_objects(remote_list, {
            :header => 'TrEx Environments:',
            :with_numbers => true
        })
        value = ask_for_number(remote_list.size)
        remote_list[value-1]['env']
      end

      remote = remotes[env]

      email = options[:email] || ask('Enter your email: ')
      password = options[:password] || ask_for_password('Enter your password: ')

      data = post('authorize', {email: email, password: password}, {host: remote['gateway']['host']})

      if data['status']['code'] != 0
        abort(data['status']['msg'])
      end

      remotes[env]['access_token'] = data['results']['access_token']
      current_config['remote'] = env
      update_config

      whoami
    end

    desc 'logout', 'Logs user out from all remotes'
    def logout
      remotes.keys.each do |key|
        remotes[key]['access_token'] = nil
      end

      update_config
      say 'You have been logged out from all remote services'
    end

    desc 'whoami', 'shows you who you are and which remote you are connected to'
    def whoami
      # pp config
      # pp current_config
      data = get('v1/users/me')

      say
      say "You are logged in to #{current_config['remote']} environment as: \n"
      print_object(data, columns: [:id, :email, :display_name, :first_name, :last_name, :gender, :time_zone, :mugshot, :admin])
    end

    desc 'reset', 'Deletes configuration file'
    def reset
      if File.exists?("#{CONFIG_PATH}/config.yml")
        FileUtils.rm("#{CONFIG_PATH}/config.yml")
      end
      say 'Configuration has been removed.'
    end

    # map 'tr' => :translate
    # desc 'translate', 'translates a label'
    # method_option :label, :type => :string, :aliases => '-l', :required => true, :banner => 'label', :default => nil
    # method_option :description, :type => :string, :aliases => '-d', :required => false, :banner => 'context', :default => nil
    # method_option :tokens, :type => :string, :aliases => '-t', :required => false, :banner => 'tokens', :default => nil
    # method_option :options, :type => :string, :aliases => '-o', :required => false, :banner => 'options', :default => nil
    # def translate
    #   say(tr(options[:label], options[:description]))
    # end

    # desc 'itr', 'Starts interactive shell'
    # def itr
    #   help = [
    #       %w(shortcut description),
    #       %w(\q quit),
    #       %w(\h help)
    #   ]
    #
    #   print_table(help)
    #   value = ask '->'
    #
    #   while true do
    #     opts = value.split(' ')
    #     # params = opts.size > 1 ? opts[1..-1] : []
    #
    #     case opts.first
    #       when '\q'
    #         return
    #       when '\h'
    #         print_table(help)
    #       else
    #         say tr(value)
    #       end
    #
    #     value = ask '->'
    #   end
    # end

    desc 'rules SUBCOMMAND ...ARGS', 'Test and evaluate TML rules'
    subcommand 'rules', Trex::Commands::Rules

    desc 'remotes SUBCOMMAND ...ARGS', 'Manage which host the applications are located at'
    subcommand 'remotes', Trex::Commands::Remotes

    # desc 'connection SUBCOMMAND ...ARGS', 'manage which database the applications are stored in'
    # subcommand 'connection', Trex::Commands::Connection

    desc 'languages SUBCOMMAND ...ARGS', 'Language commands'
    subcommand 'languages', Trex::Commands::Languages

    desc 'projects SUBCOMMAND ...ARGS', 'Project commands'
    subcommand 'projects', Trex::Commands::Projects

    private

    def tr(label, description = nil, tokens = {}, options = {})
      application(:definition => true).language('ru').translate(label, description, tokens, options)
    end

  end
end
