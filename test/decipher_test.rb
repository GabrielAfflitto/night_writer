require 'minitest/autorun'
require 'minitest/pride'
require './lib/decipher'
require 'pry'

class DecipherTest < MiniTest::Test
  def test_it_exists
    decipher = Decipher.new("braille_in")

    assert_instance_of Decipher, decipher
  end

  def test_key_value_braille_can_invert
    decipher = Decipher.new("braille_in")

    assert_equal "a", decipher.inverted_braille[["0.", "..", ".."]]
  end

  def test_translate_to_english
    input_data = File.read("./message1.txt").chomp
    decipher = Decipher.new(input_data)
    expected = "0.0.0.0.0....00.0.0.00\n" + "00.00.0..0..00.0000..0\n" + "....0.0.0....00.0.0..."
    actual = decipher.braille_in

    assert_equal expected, actual
  end

  # def test_lower_case_conversion
  #   skip
  #   decipher = Decipher.new("braille_in")
  #
  #   assert_equal , decipher.lower_case_conversion
  # end


end
