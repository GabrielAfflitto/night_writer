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
    input_data = File.read("./message1.txt").chomp
    decipher = Decipher.new(input_data)
    decipher.add_to_individual_lines

    assert_equal ["0.", "00", ".."], decipher.

  # def test_translate_to_english
  #   input_data = File.read("./message1.txt").chomp
  #   decipher = Decipher.new(input_data)
  #   expected = "0.0.0.0.0....00.0.0.00\n" + "00.00.0..0..00.0000..0\n" + "....0.0.0....00.0.0..."
  #   actual = decipher.braille_in
  #
  #   assert_equal expected, actual
  # end

end
