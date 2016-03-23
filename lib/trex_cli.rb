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
  end
  module Tasks
  end
end

%w(
    trex/config.rb trex/commands/base.rb
    trex/commands/project_translator.rb trex/commands/project_language.rb
    trex/commands/project_translation_key.rb trex/commands/project_translation.rb
    trex/commands/source_translation_key.rb trex/commands/source_translation.rb
    trex/commands/request.rb trex/commands/source.rb trex/commands/order.rb
    trex/commands
    trex/tasks/base.rb
    trex/tasks trex/cli.rb
    trex/parsers/nodes/base.rb trex/parsers/nodes trex/parsers/base.rb trex/parsers
    trex/extractors/base.rb trex/extractors
).each do |f|
  if f.index('.rb')
    file = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', f))
    require(file)
    next
  end

  Dir[File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', f, '*.rb'))].sort.each do |file|
    require(file)
  end
end