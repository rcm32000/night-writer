require './lib/night_write'
require 'pry'

ARGV[0]
file = File.open('./lib/message.txt', 'r')
message = file.read.delete("\n")
file.close

def braille_message(message)
  split = message.split("\n")
  new_message = ""
  until split == ["", "", ""]
    new_message << "#{split[0].slice!(0..78)}\n"
    new_message << "#{split[1].slice!(0..78)}\n"
    new_message << "#{split[2].slice!(0..78)}\n\n"
  end
  new_message
end

def convert_braille_file(message)
  braille_string = ""
  until message == []
    braille_string << message.delete_at(0)
    braille_string << message.delete_at(1)
    braille_string << message.delete_at(2)
    message.delete_at(3)
    # binding.pry
  end
  braille_string
end

def english_message(message)

end

file.close
night_write = NightWriter.new
if message.start_with?('0', '.')
  lines = []
  File.open('./lib/message.txt').each { |line| lines << line }
  braille_string = convert_braille_file(lines)
  new_message = night_write.to_english(braille_string)
  file = File.new('./lib/english.txt', 'w')
  file.puts(english_message(new_message))
  file.close
  puts  "Created #{File.basename(file)} containing "\
        "#{night_write.to_english(message).length} characters"
else
  new_message = night_write.to_braille(message)
  braille_file = File.new('./lib/braille.txt', 'w')
  braille_file.puts(braille_message(new_message))
  braille_file.close
  puts  "Created #{File.basename(braille_file)} containing "\
        "#{night_write.to_braille(message).length} characters"
end

file = File.new('./lib/original_message.txt', 'w')
file.puts message
file.close
