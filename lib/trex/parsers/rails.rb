module Trex
  module Parsers
    class Rails < Trex::Parsers::Base

      def parser
        @parser ||= begin
          Treetop.load(grammar_path('rails.treetop'))
          RailsParser.new
        end
      end

      def self.parse(data)
        # pp data

        tree = parser.parse(data, :consume_all_input => false)

        # pp @@rails_parser

        return nil if tree.nil?

        # pp tree

        clean_tree(tree)

        tree.to_array
      end

    end
  end
end
