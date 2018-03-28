require './lib/night_write'
require 'pry'

ARGV[0]
file = File.open('./lib/message.txt', 'r')
message = file.read.delete("\n")
file.close

file.close
night_write = NightWriter.new
if message.start_with?('0' || '-')
  night_write.to_english(message)
  file = File.new('./lib/english.txt', 'w')
  file.puts(night_write.to_english(message))
  file.close
  puts  "Created #{File.basename(file)} containing "\
        "#{night_write.to_english(message).length} characters"
else
  night_write.to_braille(message)
  file = File.new('./lib/braille.txt', 'w')
  file.puts(night_write.to_braille(message))
  file.close
  # binding.pry
  puts  "Created #{File.basename(file)} containing "\
        "#{night_write.to_braille(message).length} characters"
end

file = File.new('./lib/original_message.txt', 'w')
file.puts message
file.close
# puts "Created #{ARGV[1]} containing #{num_of_characters} characters."
