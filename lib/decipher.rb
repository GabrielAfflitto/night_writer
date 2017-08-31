require './lib/english_library'
require 'pry'

class Decipher
  attr_reader :input_data, :line_one, :line_two, :line_three, :english_library

  def initialize(input_data)
    @input_data = input_data
    @line_one = []
    @line_two = []
    @line_three = []
    @english_library = EnglishLibrary.new
  end

  def add_to_individual_lines
    split_data = input_data.split("\n")
      until split_data.empty?
      @line_one << split_data.shift
      @line_two << split_data.shift
      @line_three << split_data.shift
    end
  end

  def convert_to_braille_characters
    @line_one.to_s(/(..)/)
    @line_two.to_s(/(..)/)
    @line_three.to_s(/(..)/)
  end

end

  input_data = File.read("./message1.txt").chomp
  decipher = Decipher.new(input_data)
