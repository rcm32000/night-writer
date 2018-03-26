require_relative  './braille_lib'
class NightWriter
	include Braille
	def convert(data)
		data = braille_alphabet
	end
end
