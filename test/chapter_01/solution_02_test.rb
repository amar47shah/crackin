require_relative '../test_helper'
require_relative '../support/namespace_configurable'
require_relative '../../lib/chapter_01/solution_02'

module Chapter01Tests
  module Solution02
    module Tests
      def test_two_blank_are_permutations
        assert_permutations '', ''
      end

      def test_unequal_lengths_not_permutations
        refute_permutations 'aaa', 'aa'
      end

      def test_same_single_character_are_permutations
        assert_permutations 'a', 'a'
      end

      def test_same_word_are_permutations
        assert_permutations 'word', 'word'
      end

      def test_word_and_jumble_are_permutations
        assert_permutations 'word', 'rowd'
      end

      def test_same_lengths_different_letters_not_permutations
        refute_permutations 'word', 'wore'
      end

      private

      def assert_permutations left, right
        actual = permutations? left, right
        assert actual
      end

      def permutations? left, right
        namespace.permutations? left, right
      end

      def problem
        Chapter01::Solution02
      end

      def refute_permutations left, right
        actual = permutations? left, right
        refute actual
      end
    end

    class LinearithmicTest < NamespaceConfigurable::LinearithmicTest
      include Tests
    end

    class LinearTest < NamespaceConfigurable::LinearTest
      include Tests
    end
  end
end
