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
    assert_raises(IndexError) { linked_list[-1] }
  end

  def test_access_head_empty_list
    assert_nil linked_list.head
    assert_raises(IndexError) { linked_list[0] }
  end

  def test_access_one_too_large
    insert :value
    assert_raises(IndexError) { linked_list[1] }
  end

  def test_access_two_too_large
    insert :value
    assert_raises(IndexError) { linked_list[2] }
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

  private

  def insert *args
    args.each { |a| linked_list.insert a }
  end

  def linked_list
    @linked_list ||= Structure::LinkedList.new
  end
end
