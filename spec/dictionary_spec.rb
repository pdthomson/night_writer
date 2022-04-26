require 'simplecov'
SimpleCov.start
require './lib/dictionary'

RSpec.describe Dictionary do

  before :each do
    @dictionary = Dictionary.new('message.txt', 'braille.txt')
  end

  it "exists and has attributes" do
    expect(@dictionary).to be_an(Dictionary)
  end

  it "can translate a single line character" do
    expect(@dictionary.single_char('p')).to eq(['00','0.','0.'])
  end

  it "can return words in braille" do
    expect(@dictionary.braille_writer.length).to eq(4)
# require 'pry' ; binding.pry
  end

end
