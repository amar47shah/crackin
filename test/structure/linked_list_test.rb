require_relative '../test_helper'
require_relative '../../lib/structure/linked_list'

# rubocop:disable Metrics/ClassLength
class LinkedListTest < Minitest::Test
  def test_at_head_after_push
    push :value
    assert_equal :value, linked_list.head
  end

  def test_access_head_by_index
    push :value
    assert_equal :value, linked_list[0]
  end

  def test_at_head_after_two_pushes
    push :first, :second
    assert_equal :second, linked_list.head
  end

  def test_access_old_head_after_two_pushes
    push :first, :second
    assert_equal :first, linked_list[1]
  end

  def test_access_negative_index
    error = assert_raises(IndexError) { linked_list[-1] }
    assert_message :negative, error
  end

  def test_access_head_empty_list
    assert_nil linked_list.head
    error = assert_raises(IndexError) { linked_list[0] }
    assert_message :empty, error
  end

  def test_access_one_too_large
    push :value
    error = assert_raises(IndexError) { linked_list[1] }
    assert_message :large, error
  end

  def test_access_two_too_large
    push :value
    error = assert_raises(IndexError) { linked_list[2] }
    assert_message :large, error
  end

  def test_index_after_push
    push :value
    index = linked_list.index :value
    assert_equal 0, index
  end

  def test_index_after_two_pushes
    push :first, :second
    index = linked_list.index :first
    assert_equal 1, index
  end

  def test_delete_head
    push :value
    deleted = linked_list.delete_at 0
    assert_equal :value, deleted
    assert linked_list.empty?
  end

  def test_delete_last
    push :first, :second
    deleted = linked_list.delete_at 1
    assert_equal :first, deleted
    assert_nil linked_list.index :first
  end

  def test_delete_middle
    push :first, :second, :third
    deleted = linked_list.delete_at 1
    assert_equal :second, deleted
    assert_equal :third, linked_list[0]
    assert_equal :first, linked_list[1]
  end

  def test_delete_index_out_of_bounds
    push :value
    error_negative = assert_raises(IndexError) { linked_list.delete_at(-1) }
    error_large    = assert_raises(IndexError) { linked_list.delete_at(1) }
    assert_message :negative, error_negative
    assert_message :large, error_large
  end

  def test_delete_from_empty
    error = assert_raises(IndexError) { linked_list.delete_at 0 }
    assert_message :empty, error
  end

  def test_pop_removes
    push :value
    assert_equal :value, linked_list.pop
    assert_nil linked_list.index :value
  end

  def test_pop_successively
    push :first, :second, :third
    assert_equal :third, linked_list.pop
    assert_equal :second, linked_list.pop
    assert_equal :first, linked_list.pop
  end

  def test_pop_empty_fails
    assert linked_list.empty?
    error = assert_raises(IndexError) { linked_list.pop }
    assert_message :empty, error
  end

  def test_each_length_one
    push :value
    mock.expect :call, true, %i(value)
    linked_list.each { |v| mock.call v }
    mock.verify
  end

  def test_each_length_three
    push :first, :second, :third
    %i(third second first).each { |arg| mock.expect :call, true, [arg] }
    linked_list.each { |v| mock.call v }
    mock.verify
  end

  def test_each_enumerator
    push :value
    mock.expect :call, true, %i(value)
    linked_list.each.each { |v| mock.call v }
    mock.verify
  end

  def test_enumerable
    ancestors = Structure::LinkedList.ancestors
    assert_includes ancestors, Enumerable
  end

  private

  def assert_message word, error
    assert_match(/#{word}/, error.message)
  end

  def linked_list
    @linked_list ||= Structure::LinkedList.new
  end

  def mock
    @mock ||= Minitest::Mock.new
  end

  def push *args
    args.each { |a| linked_list.push a }
  end
end
# rubocop:enable Metrics/ClassLength
