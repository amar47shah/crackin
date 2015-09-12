require_relative '../test_helper'
require_relative '../support/namespace_configurable'
require_relative '../../lib/chapter_01/solution_07'

module Chapter01Tests
  module Solution07
    module Tests
      def test_rotate_1x1
        assert_rotated [[5]], [[5]]
      end

      def test_rotate_2x2
        assert_rotated [[3, 1],
                        [4, 2]],
                       [[1, 2],
                        [3, 4]]
      end

      def test_rotated_3x3
        assert_rotated [[7, 4, 1],
                        [8, 5, 2],
                        [9, 6, 3]],
                       [[1, 2, 3],
                        [4, 5, 6],
                        [7, 8, 9]]
      end

      def test_rotated_4x4
        assert_rotated [[13,  9,  5,  1],
                        [14, 10,  6,  2],
                        [15, 11,  7,  3],
                        [16, 12,  8,  4]],
                       [[ 1,  2,  3,  4],
                        [ 5,  6,  7,  8],
                        [ 9, 10, 11, 12],
                        [13, 14, 15, 16]]
      end

      private

      def assert_rotated expected, input
        actual = rotate input
        assert_equal expected, actual
      end

      def problem
        Chapter01::Solution07
      end

      def rotate matrix
        namespace.rotate matrix
      end
    end

    class InPlaceTest < NamespaceConfigurable::InPlaceTest
      include Tests

      def test_same_object
        input = [[*1..5], [*6..10], [*11..15], [*16..20], [*21..25]]
        actual = rotate input
        assert_same actual, input
      end
    end

    class OutOfPlaceTest < NamespaceConfigurable::OutOfPlaceTest
      include Tests

      def test_different_object
        input = [[*1..5], [*6..10], [*11..15], [*16..20], [*21..25]]
        actual = rotate input
        refute_same actual, input
      end
    end
  end
end
