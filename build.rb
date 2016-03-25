#!/usr/bin/env ruby
require './lib/trex/version'

def run(cmd)
  print '$ ' + cmd + "\n"
  system(cmd)
end

run('gem build trex-cli.gemspec')
run("gem install trex-cli-#{Trex::VERSION}.gem --no-ri --no-rdoc")
run('rbenv rehash')

if ARGV.include?('release')
  run("git tag #{Trex::VERSION}")
  run('git push')
  run("gem push trex-cli-#{Trex::VERSION}.gem")
end