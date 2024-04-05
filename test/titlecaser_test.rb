require 'minitest/autorun'
require_relative '../lib/titlecaser'

class TitlecaserTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Titlecaser::VERSION
  end

  def test_basic_string_maintenance
    assert_equal 'Hello World', Titlecaser.titlecase('Hello World')
  end

  def test_all_strings
    File.readlines(__dir__ + '/titles.txt').each do |line|
      input, expected = line.chomp.split('|')
      assert_equal expected, Titlecaser.titlecase(input)
    end
  end
end
