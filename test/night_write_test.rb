require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'
require 'pry'

class TestNightWriter < Minitest::Test
  def test_class_exists
    nw = NightWriter.new

    assert_instance_of NightWriter, nw
  end
end
