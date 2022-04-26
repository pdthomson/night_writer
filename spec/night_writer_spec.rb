require 'simplecov'
SimpleCov.start
require './lib/night_writer'
require 'rspec'

RSpec.describe NightWriter do
  before :each do
    @night_writer = NightWriter.new('message.txt', 'braille.txt')
  end

  it "exists" do
    expect(@night_writer).to be_an(NightWriter)
  end

  it "can count characters" do
    expect(@night_writer.char_counter).to eq(90)
  end

  it "can give the ARGV message" do
    expect(@night_writer.argv_message).to eq('braille.txt')
  end
end
