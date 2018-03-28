require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'
require 'pry'

class TestNightWriter < Minitest::Test
  def test_class_exists
    night_write = NightWriter.new

    assert_instance_of NightWriter, night_write
  end

  def test_braille_one_letter
    night_write = NightWriter.new

    assert_equal "0-\n--\n--", night_write.to_braille('a')
  end

  def test_row_creation
    night_write = NightWriter.new

    assert_equal "0-\n--\n--", night_write.to_braille('a')
    assert_equal '0-', night_write.top_row
    assert_equal '--', night_write.middle_row
    assert_equal '--', night_write.bottom_row

    assert_equal "00\n-0\n0-", night_write.to_braille('n')
    assert_equal '00', night_write.top_row
    assert_equal '-0', night_write.middle_row
    assert_equal '0-', night_write.bottom_row
  end

  def test_braille_word
    night_write = NightWriter.new
    expected = "0-0-0-0-0-\n"\
               "00-00-0--0\n"\
               '----0-0-0-'
    given = night_write.to_braille('hello')

    assert_equal expected, given
  end

  def test_braille_sentence
    night_write = NightWriter.new
    expected =  "0-0-0-0-0---0-0-0-0-0-\n"\
                "00-00-0--0--00-00-0--0\n"\
                '----0-0-0-------0-0-0-'
    given = night_write.to_braille('hello hello')

    assert_equal expected, given
  end

  def test_braille_to_english_letter
    night_write = NightWriter.new

    assert_equal 'a', night_write.to_english("0-\n--\n--")
  end

  def test_braille_to_english_word
    night_write = NightWriter.new
    expected = night_write.to_english("0-0-0-0-0---0-0-0-0-0-\n"\
                                    "00-00-0--0--00-00-0--0\n"\
                                    '----0-0-0-------0-0-0-')
    given =  'hello hello'

    assert_equal expected, given
  end

  def test_english_to_braille_capital_letter
    night_write = NightWriter.new
    given = night_write.to_braille('A')
    expected = "--0-\n----\n-0--"

    assert_equal expected, given
  end

  def test_braille_sentence_with_caps
    night_write = NightWriter.new
    expected =  "--0-0-0-0-0---0-0-0-0-0-\n"\
                "--00-00-0--0--00-00-0--0\n"\
                '-0----0-0-0-------0-0-0-'
    given = night_write.to_braille('Hello hello')

    assert_equal expected, given
  end
end
