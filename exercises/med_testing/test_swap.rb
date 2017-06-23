require 'minitest/autorun'

require_relative 'swap'

class TestText < MiniTest::Test
  def setup
    @text_file = File.open('sample.txt')
    @text = @text_file.read
    @text_object = Text.new(@text)
  end

  def test_swap
    @changed_file = File.new('changed.txt')
    @changed = @changed_file.read
    assert_equal(@changed, @text_object.swap('a', 'e'))
    @changed_file.close
  end

  def test_word_count
    assert_equal(72, @text_object.word_count)
  end

  def teardown
    @text_file.close
    puts "File has been closed: #{@text_file.closed?}"
  end
end
