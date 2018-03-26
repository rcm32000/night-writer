require './lib/braille_lib'

class NightWriter
  include Braille
  attr_reader :top_row,
              :middle_row,
              :bottom_row
  def initialize(message = 'hello')
    @message = message
  end

  def convert(message)
    @top_row = ""
    @middle_row = ""
    @bottom_row = ""
    message.chars.map do |character|
      @top_row << braille_alphabet[character].split("\n")[0]
      @middle_row << braille_alphabet[character].split("\n")[1]
      @bottom_row << braille_alphabet[character].split("\n")[2]
    end
    [@top_row, @middle_row, @bottom_row].join("\n")
  end
end
