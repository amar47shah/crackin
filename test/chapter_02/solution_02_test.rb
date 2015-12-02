require_relative '../test_helper'
require_relative '../../lib/chapter_02/solution_02'

module Chapter02Tests
  module Solution02
    module Linear
      class CountFromLastTest < Minitest::Test
        def test_empty_0
          assert_from_last nil, 0
        end

        def test_one_0
          push :last
          assert_from_last :last, 0
        end

        def test_one_1
          push :last
          assert_from_last nil, 1
        end

        def test_two_0
          push :last, :one
          assert_from_last :last, 0
        end

        def test_two_1
          push :last, :one
          assert_from_last :one, 1
        end

        def test_two_5
          push :last, :one
          assert_from_last nil, 5
        end

        def test_five_3
          push :last, :one, :two, :three, :four
          assert_from_last :three, 3
        end

        def test_negative_count
          assert_raises(ArgumentError) { list.from_last(-2) }
        end

        private

        def assert_from_last expected, position
          actual = list.from_last position
          assert_equal expected, actual
        end

        def list
          @list ||= Chapter02::Solution02::Linear::CountFromLast.new
        end

        def push *values
          values.each { |value| list.push value }
        end
      end
    end
  end
end

