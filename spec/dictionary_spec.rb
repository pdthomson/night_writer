require './lib/dictionary'

RSpec.describe Dictionary do

  before :each do
    @dictionary = Dictionary.new
    ARGV = ['message.txt', 'braille.txt']
  end

  it "exists and has attributes" do
    expect(@dictionary).to be_an(Dictionary)
  end

  it "can translate a single line character" do
    expect(@dictionary.single_char('p')).to eq(['00','0.','0.'])
  end

  it "can return words in braille" do
    @dictionary2 = Dictionary.new('message.txt')
    expect(@dictionary2.braille_writer.length).to eq(90)
  end
end
