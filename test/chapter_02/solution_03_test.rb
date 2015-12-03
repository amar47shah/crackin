require_relative '../test_helper'
require_relative '../../lib/chapter_02/solution_03'

module Chapter02Tests
  module Solution03
    module Linear
      class DeleteFirstMatchTest < Minitest::Test
        def test_empty
          found = list.delete_first :value
          assert_nil found
          assert list.empty?
        end

        def test_one
          push :value
          found = list.delete_first :value
          assert_equal :value, found
          assert list.empty?
        end

        def test_one_but_no_match
          push :present
          found = list.delete_first :absent
          assert_nil found
          assert_contents :present
        end

        def test_two_first
          push :no_match, :match
          found = list.delete_first :match
          assert_equal :match, found
          assert_contents :no_match
        end

        def test_two_last
          push :match, :no_match
          found = list.delete_first :match
          assert_equal :match, found
          assert_contents :no_match
        end

        def test_two_no_match
          push :no_match, :no_match
          found = list.delete_first :match
          assert_nil found
          assert_contents :no_match, :no_match
        end

        def test_five
          push 3, 4, 3, 2, 1
          found = list.delete_first 3
          assert_equal 3, found
          assert_contents 1, 2, 4, 3
        end

        private

        def assert_contents *expected
          assert_equal expected, list.map(&:itself)
        end

        def list
          @list ||= Chapter02::Solution03::Linear::DeleteFirstMatch.new
        end

        def push *values
          values.each { |value| list.push value }
        end
      end
    end
  end
end
