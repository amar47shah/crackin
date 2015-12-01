require_relative '../test_helper'
require_relative '../../lib/chapter_02/solution_01'

module Chapter02Tests
  module Solution01
    module Tests
      def test_empty
        assert_values
      end

      def test_double
        2.times { list.push :value }
        assert_values :value
      end

      def test_triple
        3.times { list.push :value }
        assert_values :value
      end

      def test_first_and_last
        %i(same different same).each { |v| list.push v }
        assert_values :same, :different
      end

      def test_two_each
        %i(one one two two).each { |v| list.push v }
        assert_values :two, :one
      end

      def test_two_alternating
        %i(one two one two).each { |v| list.push v }
        assert_values :two, :one
      end

      def test_two_each_of_three
        %i(one two three two one three).each { |v| list.push v }
        assert_values :three, :one, :two
      end

      private

      def array_from list
        array = []
        list.each { |value| array << value }
        array
      end

      def assert_values *expected
        actual = array_from list.remove_duplicates
        assert_equal expected, actual
      end

      def list
        @list ||= klass.new
      end
    end

    module Linear
      class UniqueListTest < Minitest::Test
        include Tests

        private

        def klass
          Chapter02::Solution01::Linear::UniqueList
        end
      end
    end

    module Quadratic
      class UniqueListTest < Minitest::Test
        include Tests

        private

        def klass
          Chapter02::Solution01::Quadratic::UniqueList
        end
      end
    end
  end
end
