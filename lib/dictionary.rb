class Dictionary

  attr_reader :braille_hash,
              :translator,
              :english_hash,
              :input,
              :output

  def initialize
    @braille_hash = {
      'a' => ['0.','..','..'],
      'b' => ['0.','0.','..'],
      'c' => ['00','..','..'],
      'd' => ['00','.0','..'],
      'e' => ['0.','.0','..'],
      'f' => ['00','0.','..'],
      'g' => ['00','00','..'],
      'h' => ['0.','00','..'],
      'i' => ['.0','0.','..'],
      'j' => ['.0','00','..'],
      'k' => ['0.','..','0.'],
      'l' => ['0.','0.','0.'],
      'm' => ['00','..','0.'],
      'n' => ['00','.0','0.'],
      'o' => ['0.','.0','0.'],
      'p' => ['00','0.','0.'],
      'q' => ['00','00','0.'],
      'r' => ['0.','00','0.'],
      's' => ['.0','0.','0.'],
      't' => ['.0','00','0.'],
      'u' => ['0.','..','00'],
      'v' => ['0.','0.','00'],
      'w' => ['.0','00','.0'],
      'x' => ['00','..','00'],
      'y' => ['00','.0','00'],
      'z' => ['0.','.0','00'],
      ' ' => ['..','..','..']
    }
    @english_hash = @braille_hash.invert
    @input = File.open(ARGV[0], 'r').read
    @output = ARGV[1]#File.open(ARGV[1], 'w')
    @top = ''
    @mid = ''
    @bot = ''
  end

  def single_char(input)
    @braille_hash[input]
  end

  def braille_writer
    line_break = @input.chomp
    line_break.split('').each do |char|#split every word into a single letter so i can can the single letter method "l","i","k","e"
      @top << @braille_hash[char][0]
      @mid << @braille_hash[char][1]
      @bot << @braille_hash[char][2]
    end#.map {|array| array.scan(/.{1,80}/).join('\n')}
    braille_splitter
    cli_message
  end

  def braille_splitter
    thing = [@top, @mid, @bot].map { |row| row.scan(/.{1,80}/)}
    length = Array(0..thing[0].length)
    length.each do |num|
      File.open(@output, 'a') do |index|
        index.puts thing[0][num]
        index.puts thing[1][num]
        index.puts thing[2][num]
      end
    end
  end

end
