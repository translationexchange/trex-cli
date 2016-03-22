# -*- encoding: utf-8 -*-
#
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

require File.expand_path('../lib/trex/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'trex-cli'
  gem.version       = Trex::VERSION
  gem.authors       = ['Michael Berkovich']
  gem.email         = ['michael@translationexchange.com']
  gem.description   = %q{Translation Exchange CLI}
  gem.summary       = %q{Command line interface tools for translation exchange platform}
  gem.homepage      = 'https://github.com/translationexchange/trex-cli'

  gem.files = Dir['{lib}/**/*'] + %w(MIT-LICENSE Rakefile README.md)
  gem.test_files = Dir['test/**/*']
  gem.licenses = 'MIT-LICENSE'
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.add_dependency 'thor',              '~> 0.19'
  gem.add_dependency 'highline',          '~> 1.7'
  gem.add_dependency 'faraday',           '~> 0.9'
  gem.add_dependency 'tml',               '~> 5.4'
  gem.add_dependency 'treetop',           '~> 1.4'
  gem.add_dependency 'dbi',               '~> 0.4'
  gem.add_dependency 'dbd-pg',            '~> 0.3'
  gem.add_dependency 'pg',                '~> 0.18'
  gem.add_dependency 'activesupport',     '~> 4.2'
end
