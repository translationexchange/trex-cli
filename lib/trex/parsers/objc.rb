module Trex
  module Parsers
    class Objc < Trex::Parsers::Base

      Treetop.load(grammar_path('base.treetop'))
      Treetop.load(grammar_path('objc.treetop'))
      @@objc_parser = ObjcParser.new

      def self.parse(data)
        # pp data

        tree = @@objc_parser.parse(data)

        # pp @@rails_parser

        return nil if tree.nil?

        # pp tree

        clean_tree(tree)

        tree.to_array
      end

    end
  end
end
