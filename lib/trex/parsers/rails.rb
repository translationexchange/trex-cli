module Trex
  module Parsers
    class Rails < Trex::Parsers::Base

      Treetop.load(grammar_path('rails.treetop'))
      @@rails_parser = RailsParser.new

      def self.parse(data)
        # pp data

        tree = @@rails_parser.parse(data, :consume_all_input => false)

        # pp @@rails_parser

        return nil if tree.nil?

        # pp tree

        clean_tree(tree)

        tree.to_array
      end

    end
  end
end
