# encoding: UTF-8

require 'helper'

describe Trex::Parsers::Rails do
  describe "#parse" do
    it 'correctly parses the expressions' do

      expect(Trex::Parsers::Rails.parse('tr("Hello World")')).to eq(["tr", ["Hello World"]])
      expect(Trex::Parsers::Rails.parse('tr "Hello World"')).to eq(["tr", ["Hello World"]])
      expect(Trex::Parsers::Rails.parse('trl "Hello World"')).to eq(["trl", ["Hello World"]])
      expect(Trex::Parsers::Rails.parse('trl("Hello World")')).to eq(["trl", ["Hello World"]])
      expect(Trex::Parsers::Rails.parse("trl('Hello World')")).to eq(["trl", ["Hello World"]])
      expect(Trex::Parsers::Rails.parse("trl 'Hello World' ")).to eq(["trl", ["Hello World"]])


      # expect(Trex::Parsers::Rails.parse("trl 'Hello World', 'Message' ")).to eq(["trl", ["Hello World", "Message"]])
    end
  end
end