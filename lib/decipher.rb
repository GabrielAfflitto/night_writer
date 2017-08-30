require './lib/braille_library'
require 'pry'

class Decipher
  attr_reader :braille,
              :braille_in,
              :line_one,
              :line_two,
              :line_three,
              :compiled_braille

  def initialize(braille_in)
    @braille_in = braille_in
    @braille = BrailleLibrary.new
    @line_one = line_one
    @line_two = line_two
    @line_three = line_three
    @compiled_braille = ""
  end

  def translate_to_eng
    @compiled_braille.map do |character|
      inverted_braille[character]
    end
  end

  def inverted_braille
    @braille.braille_conversion.invert
  end

  def lower_case_conversion
    characters = []
    characters << @line_one.slice!(0..1)
    characters << @line_two.slice!(0..1)
    characters << @line_three.slice!(0..1)
    @compiled_braille << characters
  end

end
binding.pry
