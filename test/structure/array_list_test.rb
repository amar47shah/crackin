require_relative '../test_helper'
require_relative '../../lib/structure/array_list'

class ArrayListTest < Minitest::Test
  def test_empty_has_size_zero
    assert_equal 0, array_list.size
  end

  def test_empty_has_capacity_one
    assert_equal 1, capacity
  end

  def test_push_increases_size
    push :value
    assert_equal 1, array_list.size
  end

  def test_first_push_does_not_increase_capacity
    push :value
    assert_equal 1, capacity
  end

  def test_second_push_increases_capacity
    push :first, :second
    assert_equal 2, capacity
  end

  def test_third_push_doubles_capacity
    push :first, :second, :third
    assert_equal 4, capacity
  end

  def test_can_retrieve_value
    push :value
    retrieved = array_list.value_at 0
    assert_equal :value, retrieved
  end

  def test_retrieval_out_of_bounds_fails
    assert_raises(IndexError) { array_list.value_at 5 }
  end

  private

  def array_list
    @array_list ||= Structure::ArrayList.new
  end

  def capacity
    array_list.send :capacity
  end

  def push *values
    values.each { |value| array_list.push value }
  end
end
