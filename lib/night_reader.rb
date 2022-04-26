def char_counter
  @braille_input.length
end

def argv_message
  if ARGV.length != 2#get cheeky and make sure they give 2 CLI parameters
    puts "FOOL! I got a feva I need more parameters"
    exit
  end
    p "File #{ARGV[1]} has been made with #{char_counter} characters"
end
