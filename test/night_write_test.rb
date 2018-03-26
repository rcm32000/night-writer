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
    nw = NightWriter.new

    assert_equal "0-\n--\n--", nw.convert('a')
  end
end
