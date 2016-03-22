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
  module Extractors
    class Base

      # Main extraction method
      def self.extract(cmd, source_path, destination_path, grammar_path = nil)
        unless File.exist?(source_path)
          abort('Source path does not exist')
        end

        if destination_path.nil? or not File.exist?(destination_path)
          abort('Destination path does not exist')
        end

        t0 = Time.now

        # for individual files with a specific grammar
        if grammar_path
          unless File.file?(source_path)
            abort('For grammar specific extractions, only individual files are supported')
          end

          extract_file(cmd, source_path, source_path, destination_path, grammar_path)
        else
          if File.file?(source_path)
            extract_file(cmd, source_path, source_path, destination_path)
          else
            extract_folder(cmd, source_path, destination_path)
          end
        end

        t1 = Time.now

        puts "Extraction took #{t1-t0} mls"
      end

      # extracts a single file
      def self.extract_file(cmd, file, source_path, destination_path, grammar_path = nil)
        if grammar_path
          extractor = Trex::Extractors::Generic.new(file)
        else
          extractor = select_extractor(file)
        end

        unless extractor
          raise 'The file is not yet supported'
        end

        pp "Processing #{file}..."

        extractor.cmd = cmd
        extractor.source_path = source_path
        extractor.destination_path = destination_path
        extractor.grammar_path = grammar_path
        extractor.process
      end

      # scans and extracts an entire folder with all subfolders
      def self.extract_folder(cmd, source_path, destination_path, opts = {})
        source_path += File::Separator unless source_path.match(/#{File::Separator}$/)

        Dir.glob("#{source_path}*").each do |file|
          name = file.gsub(source_path, '')
          next if ignored?(name)

          opts[:depth] ||= 0
          # puts ('  ' * opts[:depth]) + name

          if File.file?(file)
            extract_file(cmd, file, source_path, destination_path)
            # prints(scanner.class.name.split('::').last[0])
          elsif File.directory?(file)
            extract_folder(cmd, file, destination_path, opts.merge(:depth => opts[:depth] + 1))
          end
        end
      end

      # provides a list of available extractors
      def self.extractors
        @extractors ||= begin
          classes = []
          Dir.glob("#{__dir__}/*").each do |f|
            name = f.split(File::Separator).last.gsub('.rb', '').capitalize
            next if name == 'Base'
            classes << Module.const_get("Trex::Extractors::#{name}")
          end
          classes
        end
      end

      # default set of ignored folders
      def self.ignored_folders
        %w(cache db spec script log tmp config public assets images)
      end

      # checks if the file should be ignored
      def self.ignored?(f)
        return true if File.directory?(f) and f.match(/#{ignored_folders.join('|')}/)
        false
      end

      # prints a string without breaks
      def self.prints(str)
        print str
        $stdout.flush
      end

      # selects an extractor for a specific file type
      def self.select_extractor(file)
        scanner_class = extractors.find { |extractor| extractor.applicable?(file) }
        scanner_class ? scanner_class.new(file) : nil
      end

      # checks if the extrator is applicable for the file type
      def self.applicable?(file)
        return false unless pattern
        file.match(pattern)
      end

      def self.pattern
        nil
      end

      attr_accessor :file, :source_path, :destination_path, :grammar_path, :cmd

      def initialize(file)
        @file = file
      end

      def content
        @content ||= File.read(file)
      end

      def process
        raise 'Must be implemented by the extending class'
      end

      def write_keys(keys)
        file_name = file.split(File::Separator).last
        file_name += '.json'

        delta = file.gsub(source_path, '')
        delta = file_name if delta.empty?

        destination_file = File.join(destination_path, delta)
        dir = destination_file.split(File::Separator)[0..-2].join(File::Separator)
        FileUtils.mkdir_p(dir)

        File.open(destination_file, 'w') do |file|
          file.write(keys.to_json)
        end
      end

      def clean_parse_tree(root_node)
        return if(root_node.elements.nil?)
        root_node.elements.delete_if{|node| node.class.name == 'Treetop::Runtime::SyntaxNode' }
        root_node.elements.each {|node| clean_parse_tree(node) }
      end

    end
  end
end
