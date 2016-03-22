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
  module Scanners
    class Base

      def self.scan(cmd, path)
        # pp "Scanning #{path}"
        scan_folder(cmd, path)
      end

      def self.scanners
        @scanners ||= begin
          classes = []
          Dir.glob("#{__dir__}/*").each do |f|
            name = f.split(File::Separator).last.gsub('.rb', '').capitalize
            next if name == 'Base'
            classes << Module.const_get("Trex::Scanners::#{name}")
          end
          classes
        end
      end

      def self.ignored_folders
        %w(cache db spec script log tmp config public assets images)
      end

      def self.ignored?(f)
        return true if File.directory?(f) and f.match(/#{ignored_folders.join('|')}/)
        false
      end

      def self.scan_folder(cmd, path, opts = {})
        path += File::Separator unless path.match(/#{File::Separator}$/)
        Dir.glob("#{path}*").each do |file|
          name = file.gsub(path, '')
          next if ignored?(name)

          opts[:depth] ||= 0
          # puts ('  ' * opts[:depth]) + name

          if File.file?(file)
            scanner = select_scanner(file)
            unless scanner
              # prints('.')
              next
            end

            pp "processing #{file}"

            scanner.cmd = cmd
            scanner.root = path
            scanner.process

            # prints(scanner.class.name.split('::').last[0])
          elsif File.directory?(file)
            scan_folder(cmd, file, opts.merge(:depth => opts[:depth] + 1))
          end
        end
      end

      def self.prints(str)
        print str
        $stdout.flush
      end

      def self.select_scanner(file)
        scanner_class = scanners.find{|scanner| scanner.applicable?(file)}
        scanner_class ? scanner_class.new(file) : nil
      end

      def self.applicable?(file)
        return false unless pattern
        file.match(pattern)
      end

      def self.pattern
        nil
      end

      attr_accessor :file, :root, :cmd

      def initialize(file)
        @file = file
      end

      def content
        @content ||= File.read(file)
      end

      def process
        raise 'Must be implemented by the extending class'
      end

    end
  end
end
