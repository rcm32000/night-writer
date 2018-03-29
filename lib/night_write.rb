require './lib/braille_lib'

class NightWriter
  include Braille
  attr_reader :top_row,
              :middle_row,
              :bottom_row

  def to_braille(message)
    empty_rows
    message.chars.map do |character|
      if number?(character) == true
        english_number?(character)
      else
        english_capitalize?(character)
        @top_row << braille_alphabet[character.downcase].split("\n")[0]
        @middle_row << braille_alphabet[character.downcase].split("\n")[1]
        @bottom_row << braille_alphabet[character.downcase].split("\n")[2]
      end
    end
    [@top_row,@middle_row,@bottom_row].join("\n")
  end

  def to_english(message)
    english = ''
    split = message.split("\n")
    split_loop(english, split)
    number_converter(english)
  end

  def split_loop(english, split)
    until split == ['', '', '']
      empty_rows
      splitter(split)
      letter = [@top_row, @middle_row, @bottom_row].join("\n")
      capital?(english, split, letter)
    end
  end

  def splitter(split)
    @top_row << split[0].slice!(0,2)
    @middle_row << split[1].slice!(0,2)
    @bottom_row << split[2].slice!(0,2)
  end

  def capital?(english, split, letter)
    if braille_alphabet.key(letter) == 'capital'
      empty_rows
      splitter(split)
      letter = [@top_row, @middle_row, @bottom_row].join("\n")
      english << braille_alphabet.key(letter).upcase
    else
      english << braille_alphabet.key(letter)
    end
  end

  def english_capitalize?(character)
    if (character == character.upcase) &&
      ('a'..'z').to_a.include?(character.downcase)
      @top_row << '..'
      @middle_row << '..'
      @bottom_row << '.0'
    end
  end

  def english_number?(character)
    @top_row << braille_alphabet[character].split("\n")[0]
    @middle_row << braille_alphabet[character].split("\n")[1]
    @bottom_row << braille_alphabet[character].split("\n")[2]
  end

  def empty_rows
    @top_row = ''
    @middle_row = ''
    @bottom_row = ''
  end

  def number?(character)
    ('0'..'9').to_a.include?(character)
  end

  def number_converter(string)
    new_string = string.chars
    final_string = ''
    new_string.map.with_index do |char, index|
      if char == '#'
        character = char + new_string[index + 1]
        final_string << letter_to_number[character]
        new_string.delete_at(index + 1)
      else
        final_string << char
      end
    end
    final_string
  end
end
