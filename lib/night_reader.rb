require './lib/decipher'

file_in = ARGV[0]
file_out = ARGV[1]

input_data = File.read(file_in).chomp

decipher = Decipher.new(input_data)

output = File.open(file_out, "w+")
output.write(decipher)

puts "Created #{ARGV[1]} containing #{decipher.braille_in.length} characters."
