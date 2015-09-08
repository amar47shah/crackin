require_relative '../test_helper'
require_relative '../../lib/chapter_01/solution_01'

module Chapter01Tests
  class Solution01Test < Minitest::Test
    def test_quadratic_solution
      self.runtime = 'Quadratic'
      test_all
    end

    def test_linearithmic_solution
      self.runtime = 'Linearithmic'
      test_all
    end

    def test_linear_solution
      self.runtime = 'Linear'
      test_all
    end

    private

    attr_reader :runtime

    def unique_characters? string
      runtime.unique_characters? string
    end

    def runtime= module_name
      @runtime = Chapter01::Solution01.const_get module_name
    end

    def test_all
      test_empty_has_unique_characters
      test_one_character_is_unique
      test_two_different_characters_are_unique
      test_two_of_the_same_are_not_unique
      test_three_characters_in_palindrome_are_not_unique
    end

    def test_empty_has_unique_characters
      assert unique_characters? ''
    end

    def test_one_character_is_unique
      assert unique_characters? '1'
    end

    def test_two_different_characters_are_unique
      assert unique_characters? '12'
    end

    def test_two_of_the_same_are_not_unique
      refute unique_characters? '11'
    end

    def test_three_characters_in_palindrome_are_not_unique
      refute unique_characters? '121'
    end
  end

  class ArrayTest < Minitest::Test
    def test_twenty_searches
      20.times { test_same_as_include }
    end

    private

    def multiples_of_five_in_order_up_to_a_hundred
      [*(0..100).step(5)]
    end

    def presorted
      multiples_of_five_in_order_up_to_a_hundred
    end

    def random_up_to_a_hundred
      (rand * 101).floor
    end

    def test_same_as_include
      r = random_up_to_a_hundred
      expected = presorted.include? r
      actual   = presorted.binary_search? r
      assert_equal expected, actual
    end
  end
end
