require 'minitest/autorun'
require 'minitest/pride'
require './lib/decipher'
require 'pry'

class DecipherTest < MiniTest::Test
  def test_it_exists

    decipher = Decipher.new("input_data")

    assert_instance_of Decipher, decipher
  end

  def test_add_to_individual_lines
    input_data = File.read("./message1.txt").chomp
    decipher = Decipher.new(input_data)
    actual = decipher.add_to_individual_lines

    assert_nil nil, decipher.add_to_individual_lines
  end

  def test_all_lines_shoveled
    input_data = File.read("./message1.txt").chomp
    decipher = Decipher.new(input_data)
    decipher.add_to_individual_lines

    assert_equal ["0.0.0.0.0....00.0.0.00"], decipher.line_one
    assert_equal ["00.00.0..0..00.0000..0"], decipher.line_two
    assert_equal ["....0.0.0....00.0.0..."], decipher.line_three
  end

  def test_conversion_to_braille_characters
    input_data = File.read("./message3.txt").chomp
    decipher = Decipher.new(input_data)
    decipher.add_to_individual_lines
    decipher.convert_to_braille_characters

    assert_equal [["0.", "00", ".."]], decipher.zip_it_up(["0."], ["00"], [".."])
  end

  def test_translate_to_english
    input_data = File.read("./message1.txt").chomp
    decipher = Decipher.new(input_data)
    decipher.add_to_individual_lines
    decipher.convert_to_braille_characters

    converted_one = ["0.", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", "00"]
    converted_two = ["00", ".0", "0.", "0.", ".0", "..", "00", ".0", "00", "0.", ".0"]
    converted_three = ["..", "..", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", ".."]

    assert_equal [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."], ["..", "..", ".."], [".0", "00", ".0"], ["0.", ".0", "0."], ["0.", "00", "0."], ["0.", "0.", "0."], ["00", ".0", ".."]], decipher.zip_it_up(converted_one, converted_two, converted_three)
  end

  
end
