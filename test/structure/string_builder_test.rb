require_relative '../test_helper'
require_relative '../../lib/structure/string_builder'

class Structure::StringBuilderTest < Minitest::Test
  def test_empty_by_default
    assert_empty string_builder.to_s
  end

  def test_can_initialize_with_string
    string_builder = Structure::StringBuilder.new 'starting string'
    assert_equal 'starting string', string_builder.to_s
  end

  def test_can_append_string
    append 'a string'
    assert_equal 'a string', string_builder.to_s
  end

  def test_can_append_two_strings
    append 'a string', ' and another'
    assert_equal 'a string and another', string_builder.to_s
  end

  def test_can_append_to_initial_string
    self.string_builder = Structure::StringBuilder.new 'beginning'
    append ' middle', ' end'
    assert_equal 'beginning middle end', string_builder.to_s
  end

  private

  attr_writer :string_builder

  def append *strings
    strings.each { |string| string_builder.append string }
  end

  def string_builder
    @string_builder ||= Structure::StringBuilder.new
  end
end
