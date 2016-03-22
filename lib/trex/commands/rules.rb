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
    class Rules < Trex::Commands::Base
      namespace :rules

      desc 'eval', 'evaluates Tr8n rule'
      method_option :expr, :type => :string, :aliases => "-e", :required => true, :banner => "expression to evaluate", :default => nil
      def eval
        expr = options[:expr]
        if /^\(/.match(expr)  # (+ 1 2)
          p = Tml::RulesEngine::Parser.new(expr)
          expression = p.parse
        elsif /^\[/.match(expr) # ["+", 1, 2]
          expression = JSON.parse(expr)
        end

        l = Tml::RulesEngine::Evaluator.new
        say "#{expr} results in #{l.evaluate(expression)}"
      end

      desc 'repl', 'starts Repl for Tr8n rules engine'
      def repl
        lisp = Tml::RulesEngine::Evaluator.new
        sexp = ask '->'
        history = []

        while true do
          case sexp
            when '\q'
              return
            when '\h'
              table = [
                  ['shortcut', 'description'],
                  ['\q', "quit"],
                  ['\h', "help"],
                  ['\r', "history"],
                  ['\v', "variables"],
                  ['\s', "symbols"],
              ]
              print_table(table)
            when '\v'
              table = []
              lisp.vars.each do |k, v|
                table << ["#{k}: ", v]
              end
              print_table(table)
              say('No variables found') if table.empty?
            when '\s'
              table = []
              lisp.env.keys.sort.each do |k|
                next if lisp.vars.keys.include?(k)
                table << [k]
              end
              print_table(table)
              say('No symbols found') if table.empty?
            when '\r'
              table = [["", "expression", "result"]]
              history.each_with_index do |h, i|
                table << ["#{i+1}).", h[0], h[1]]
              end
              print_table(table)
              say("No history found") if table.empty?
            else
              begin
                if /^\(/.match(sexp)  # (+ 1 2)
                  p_sexp = Tml::RulesEngine::Parser.new(sexp).parse
                elsif /^\[/.match(sexp) # ["+", 1, 2]
                  p_sexp = JSON.parse(sexp)
                else
                  p_sexp = sexp
                end

                result = lisp.evaluate(p_sexp)
                history << [sexp, result]
                p result
              rescue Exception => ex
                say "Error: #{ex.message}"
              end
          end

          sexp = ask '->'
        end
      end
    end
  end
end
