require_relative '../test_helper'
require_relative '../support/namespace_configurable'
require_relative '../../lib/chapter_01/solution_03'

module Chapter01Tests
  module Solution03
    module Tests
      def test_blank_unchanged
        assert_urlified '', '', 0
      end

      def test_single_space_replaced
        assert_urlified '%20', '   ', 1
      end

      def test_double_space_both_replaced
        assert_urlified '%20%20', '      ', 2
      end

      def test_two_spaces_surrounding_word_replaced
        assert_urlified '%20word%20', ' word     ', 6
      end

      def test_spaces_between_two_words_replaced
        assert_urlified 'Mr%20John%20Smith', 'Mr John Smith    ', 13
      end

      private

      def assert_urlified expected, string, length
        actual = urlify string, length
        assert_equal expected, actual
      end

      def problem
        Chapter01::Solution03
      end

      def urlify string, length
        namespace.urlify string, length
      end
    end

    class LinearTest < NamespaceConfigurable::LinearTest
      include Tests
    end
  end
end

