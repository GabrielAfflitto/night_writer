require './lib/english_library'
require 'pry'

class Decipher
  attr_reader :input_data, :line_one, :line_two, :line_three, :english_library
  attr_accessor :zipped

  def initialize(input_data)
    @input_data = input_data
    @line_one = []
    @line_two = []
    @line_three = []
    @zipped = []
    @english_library = EnglishLibrary.new
    binding.pry
  end

  def add_to_individual_lines
    split_data = @input_data.split("\n")
      until split_data.empty?
      @line_one << split_data.shift
      @line_two << split_data.shift
      @line_three << split_data.shift
    end
    convert_to_braille_characters
  end

  def convert_to_braille_characters
    converted_one = @line_one.join.scan(/../)
    converted_two = @line_two.join.scan(/../)
    converted_three = @line_three.join.scan(/../)
    zip_it_up(converted_one, converted_two, converted_three)
  end

  def zip_it_up(converted_one, converted_two, converted_three)
    @zipped = converted_one.zip(converted_two, converted_three)
  end

  def translate_to_english
    letters_as_characters = ""
    @zipped.each do |character|
      letters_as_characters << @english_library.english_conversion[character]
    end
    letters_as_characters
  end

end

  #
  # input_data = File.read("./message1.txt").chomp
  # decipher = Decipher.new(input_data)
  # decipher.add_to_individual_lines
  # decipher.convert_to_braille_characters
  # decipher.translate_to_english
