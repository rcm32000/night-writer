require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'
require 'pry'

class TestNightWriter < Minitest::Test
  def test_class_exists
    night_writer = NightWriter.new

    assert_instance_of NightWriter, night_writer
  end

  def test_convert_one_letter
    night_writer = NightWriter.new

    assert_equal "0-\n--\n--", night_writer.convert('a')
  end

end
