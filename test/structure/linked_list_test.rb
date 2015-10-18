require_relative '../test_helper'
require_relative '../../lib/structure/linked_list'

class LinkedListTest < Minitest::Test
  def test_at_head_after_insert
    insert :value
    assert_equal :value, linked_list.head
  end

  def test_access_head_by_index
    insert :value
    assert_equal :value, linked_list[0]
  end

  def test_at_head_after_two_inserts
    insert :first, :second
    assert_equal :second, linked_list.head
  end

  def test_access_old_head_after_two_inserts
    insert :first, :second
    assert_equal :first, linked_list[1]
  end

  def test_access_negative_index
    error = assert_raises(IndexError) { linked_list[-1] }
    assert_message(/negative/, error)
  end

  def test_access_head_empty_list
    assert_nil linked_list.head
    error = assert_raises(IndexError) { linked_list[0] }
    assert_message(/empty/, error)
  end

  def test_access_one_too_large
    insert :value
    error = assert_raises(IndexError) { linked_list[1] }
    assert_message(/large/, error)
  end

  def test_access_two_too_large
    insert :value
    error = assert_raises(IndexError) { linked_list[2] }
    assert_message(/large/, error)
  end

  def test_index_after_insert
    insert :value
    index = linked_list.index :value
    assert_equal 0, index
  end

  def test_index_after_two_inserts
    insert :first, :second
    index = linked_list.index :first
    assert_equal 1, index
  end

  def test_delete_head
    insert :value
    deleted = linked_list.delete 0
    assert_equal :value, deleted
    assert linked_list.empty?
  end

  def test_delete_last
    insert :first, :second
    deleted = linked_list.delete 1
    assert_equal :first, deleted
    assert_nil linked_list.index :first
  end

  def test_delete_middle
    insert :first, :second, :third
    deleted = linked_list.delete 1
    assert_equal :second, deleted
    assert_equal :third, linked_list[0]
    assert_equal :first, linked_list[1]
  end

  def test_delete_index_out_of_bounds
    insert :value
    error_negative = assert_raises(IndexError) { linked_list.delete(-1) }
    error_large    = assert_raises(IndexError) { linked_list.delete(1) }
    assert_message(/negative/, error_negative)
    assert_message(/large/, error_large)
  end

  def test_delete_from_empty
    error = assert_raises(IndexError) { linked_list.delete 0 }
    assert_message(/empty/, error)
  end

  private

  def assert_message matcher, error
    assert_match matcher, error.message
  end

  def insert *args
    args.each { |a| linked_list.insert a }
  end

  def linked_list
    @linked_list ||= Structure::LinkedList.new
  end
end
