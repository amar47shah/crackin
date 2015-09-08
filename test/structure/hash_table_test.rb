require_relative '../test_helper'
require_relative '../../lib/structure/hash_table'

class HashTableTest < Minitest::Test
  def test_can_find_after_insert
    hash_table.insert :key, :value
    retrieved =  hash_table.find :key
    assert_equal retrieved, :value
  end

  def test_can_change_value
    hash_table.insert :same, :value
    hash_table.insert :same, :new_value
    retrieved = hash_table.find :same
    assert_equal retrieved, :new_value
  end

  def test_can_insert_two_keys
    hash_table.insert :first , :value
    hash_table.insert :second, :another
    first  = hash_table.find :first
    second = hash_table.find :second
    assert_equal first , :value
    assert_equal second, :another
  end

  def test_cannot_find_unknown_key
    retrieved = hash_table.find :unknown
    assert_nil retrieved
  end

  private

  def hash_table
    @hash_table ||= Structure::HashTable.new 5
  end
end
