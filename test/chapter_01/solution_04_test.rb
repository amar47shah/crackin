require_relative '../test_helper'
require_relative '../support/namespace_configurable'
require_relative '../../lib/chapter_01/solution_04'

module Chapter01Tests
  module Solution04
    module Tests
      def test_blank_is_pp
        assert palindrome_permutation? ''
      end

      def test_single_character_is_pp
        assert palindrome_permutation? 'a'
      end

      def test_double_character_is_pp
        assert palindrome_permutation? 'aa'
      end

      def test_aab_is_pp
        assert palindrome_permutation? 'aab'
      end

      def test_aaab_is_not_pp
        refute palindrome_permutation? 'aaab'
      end

      def test_aaabb_is_pp
        assert palindrome_permutation? 'aaabb'
      end

      def test_aaabbc_is_not_pp
        refute palindrome_permutation? 'aaabbc'
      end

      def test_aaaabbc_is_pp
        assert palindrome_permutation? 'aaaabbc'
      end

      def test_abacaba_is_pp
        assert palindrome_permutation? 'abacaba'
      end

      def test_long_jumbled_palindrome_is_pp
        assert palindrome_permutation? 'man a panama plan a canal a'
      end

      private

      def palindrome_permutation? string
        namespace.palindrome_permutation? string
      end

      def problem
        Chapter01::Solution04
      end
    end

    class LinearTest < NamespaceConfigurable::Test
      include Tests
    end
  end
end
