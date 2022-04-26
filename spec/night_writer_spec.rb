require './lib/night_writer'
require 'rspec'

RSpec.describe NightWriter do
  before :each do
    @night_writer = NightWriter.new
    ARGV = ['message.txt', 'braille.txt']

    # @night_writer = NightWriter('message.txt', 'braille.txt')
  end
  # require 'pry' ; binding.pry

  it "exists" do
    expect(@night_writer).to be_an(NightWriter)
  end

  xit "can read the file" do
    allow(@input).to recieve(:read_file).with('message.txt')
  end
end
