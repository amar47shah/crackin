require_relative '../test_helper'
require_relative '../support/namespace_configurable'
require_relative '../../lib/chapter_01/solution_06'

module Chapter01Tests
  module Solution06
    module Tests
      def test_a_unchanged
        assert_compressed_already 'a'
      end

      def test_aa_unchanged
        assert_compressed_already 'aa'
      end

      def test_aaa_a3
        assert_compressed 'a3', 'aaa'
      end

      def test_aabb_unchanged
        assert_compressed_already 'aabb'
      end

      def test_aabbb_a2b3
        assert_compressed 'a2b3', 'aabbb'
      end

      def test_abcc_unchanged
        assert_compressed_already 'abcc'
      end

      def test_abccc_unchanged
        assert_compressed_already 'abccc'
      end

      def test_abcccc_unchanged
        assert_compressed_already 'abcccc'
      end

      def test_ccccab_unchanged
        assert_compressed_already 'ccccab'
      end

      def test_abccccc_a1b1c5
        assert_compressed 'a1b1c5', 'abccccc'
      end

      private

      def assert_compressed_already input
        assert_compressed input, input
      end

      def assert_compressed expected, input
        actual = compress input
        assert_equal expected, actual
      end

      def compress string
        namespace.compress string
      end

      def problem
        Chapter01::Solution06
      end
    end

    class LinearTest < NamespaceConfigurable::LinearTest
      include Tests
    end
  end
end

