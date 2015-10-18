require_relative '../test_helper'
require_relative '../support/namespace_configurable'
require_relative '../../lib/chapter_01/solution_08'

module Chapter01Tests
  module Solution08
    module Tests
      def test_flowed_1x1
        assert_flowed [[5]], [[5]]
      end

      def test_flowed_2x2
        assert_flowed [[0, 0], [0, 4]], [[0, 2], [3, 4]]
      end

      def test_flowed_2x2_no_change
        assert_flowed [[1, 2], [3, 4]], [[1, 2], [3, 4]]
      end

      def test_flowed_2x3
        assert_flowed [[0, 2, 3], [0, 0, 0]], [[1, 2, 3], [0, 5, 6]]
      end

      def test_flowed_3x2
        assert_flowed [[1, 0], [0, 0], [5, 0]], [[1, 2], [3, 0], [5, 6]]
      end

      def test_flowed_3x3
        assert_flowed [[1, 0, 3], [0, 0, 0], [7, 0, 9]],
                      [[1, 2, 3], [4, 0, 6], [7, 8, 9]]
      end

      # rubocop:disable Metrics/MethodLength
      def test_flowed_8x5
        assert_flowed(
          [[0, 0, 0, 0, 0],
           [0, 1, 0, 0, 0],
           [0, 0, 0, 0, 0],
           [0, 1, 0, 0, 0],
           [0, 0, 0, 0, 0],
           [0, 0, 0, 0, 0],
           [0, 1, 0, 0, 0],
           [0, 0, 0, 0, 0]],
          [[0, 1, 1, 0, 1],
           [1, 1, 1, 1, 1],
           [1, 1, 1, 0, 0],
           [1, 1, 1, 1, 1],
           [0, 1, 1, 1, 1],
           [0, 1, 1, 1, 0],
           [1, 1, 1, 1, 1],
           [0, 1, 0, 0, 0]]
        )
      end
      # rubocop:enable Metrics/MethodLength

      private

      def assert_flowed expected, input
        actual = flow_zeroes input
        assert_equal expected, actual
      end

      def problem
        Chapter01::Solution08
      end

      def flow_zeroes matrix
        namespace.flow_zeroes matrix
      end
    end

    class Version01Test < NamespaceConfigurable::Test
      include Tests
    end

    class Version02Test < NamespaceConfigurable::Test
      include Tests
    end

    class Version03Test < NamespaceConfigurable::Test
      include Tests
    end
  end
end
