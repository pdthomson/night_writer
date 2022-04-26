require_relative 'night_writer'
require './lib/dictionary'
night = NightWriter.new('message.txt', 'braille.txt')
night.braille_writer
night.argv_message
