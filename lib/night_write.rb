require './lib/braille_lib'

class NightWriter
  include Braille
  def initialize(message = 'hello')
    @message = message
  end

  def convert(message)
    message.chars.map do |character|
      braille_alphabet[character]
    end
  end
end
