require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'
require 'pry'

class TestNightWriter < Minitest::Test
  def test_class_exists
    nw = NightWriter.new

    assert_instance_of NightWriter, nw
  end

  def test_convert_one_letter
    skip
    nw = NightWriter.new

    assert_equal "0-\n--\n--", nw.convert('a')
  end

  def test_row_creation
    skip
    nw = NightWriter.new

    assert_equal "0-\n--\n--", nw.convert('a')
    assert_equal "0-", nw.top_row
    assert_equal "--", nw.middle_row
    assert_equal "--", nw.bottom_row

    assert_equal "00\n-0\n0-", nw.convert('n')
    assert_equal "00", nw.top_row
    assert_equal "-0", nw.middle_row
    assert_equal "0-", nw.bottom_row
  end

  def test_convert_word
    skip
    nw = NightWriter.new
    expected = "0-\n"
               "00\n"
               "--\n"
    given = nw.convert('hello')

    assert_equal expected, given
  end
end
