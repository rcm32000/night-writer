require './lib/braille_lib'

class NightWriter
  include Braille
  attr_reader :top_row,
              :middle_row,
              :bottom_row

  def to_braille(message)
    empty_rows
    message.chars.map do |character|
      character_capitalize?(character)
      @top_row << braille_alphabet[character.downcase].split("\n")[0]
      @middle_row << braille_alphabet[character.downcase].split("\n")[1]
      @bottom_row << braille_alphabet[character.downcase].split("\n")[2]
    end
    [@top_row,@middle_row,@bottom_row].join("\n")
  end

  def to_english(message)
    english = ''
    split = message.split("\n")
    until split == ['', '', '']
      empty_rows
      @top_row << split[0].slice!(0,2)
      @middle_row << split[1].slice!(0,2)
      @bottom_row << split[2].slice!(0,2)
      letter = [@top_row,@middle_row,@bottom_row].join("\n")
      english << braille_alphabet.key(letter)
    end
    english
  end

  def character_capitalize?(character)
    if (character == character.upcase) &&
       ('a'..'z').to_a.include?(character.downcase)
      @top_row << '..'
      @middle_row << '..'
      @bottom_row << '.0'
    end
  end

  def empty_rows
    @top_row = ''
    @middle_row = ''
    @bottom_row = ''
  end
end
