# module Trex
#   module Parsers
#     class Sample < Trex::Parsers::Base
#
#       Treetop.load(grammar_path('sample.treetop'))
#       @@parser = SampleParser.new
#
#       def self.parse(data)
#         pp data
#
#         pp @@parser
#
#         tree = @@parser.parse(data)
#
#         if(tree.nil?)
#           raise Exception, "Parse error at offset: #{@@parser.index}"
#         end
#
#         clean_tree(tree)
#
#         pp tree.to_array
#       end
#
#     end
#   end
# end
