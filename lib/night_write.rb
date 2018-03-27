require './lib/braille_lib'

class NightWriter
  include Braille
  attr_reader :top_row,
              :middle_row,
              :bottom_row
  def initialize(message = 'hello')
    @message = message
	@top_row = ""
	@middle_row = ""
	@bottom_row = ""
  end

  def braille(message)
	  @top_row = ""
  	@middle_row = ""
  	@bottom_row = ""
    message.chars.map do |character|
        # binding.pry
        if (character == character.upcase) && (('a'..'z').to_a.include?(character.downcase))
            @top_row << '--'
            @middle_row << '--'
            @bottom_row << '-0'
        end
        # binding.pry
     @top_row << braille_alphabet[character.downcase].split("\n")[0]
	 @middle_row << braille_alphabet[character.downcase].split("\n")[1]
	 @bottom_row << braille_alphabet[character.downcase].split("\n")[2]
    end
	[@top_row,@middle_row,@bottom_row].join("\n")
  end

  def english(message)
    english = ""
    split = message.split("\n")
    until split == ["", "", ""]
      @top_row = ""
      @middle_row = ""
      @bottom_row = ""
      @top_row << split[0].slice!(0,2)
      @middle_row << split[1].slice!(0,2)
      @bottom_row << split[2].slice!(0,2)
      letter = [@top_row,@middle_row,@bottom_row].join("\n")
      english << braille_alphabet.key(letter)
    end
    english
  end
end
