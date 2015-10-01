require_relative '../test_helper'
require_relative '../support/namespace_configurable'
require_relative '../../lib/chapter_01/solution_05'

module Chapter01Tests
  module Solution05
    module Tests
      def test_identical_strings_are_one_away
        assert one_away? 'same string', 'same string'
      end

      def test_one_replacement_is_one_away
        assert one_away? 'some string', 'sAme string'
      end

      def test_two_replacements_not_one_away
        refute one_away? 'some string', 'sAme strAng'
      end

      def test_one_insertion_one_away
        assert one_away? 'curse', 'course'
      end

      def test_two_insertions_not_one_away
        refute one_away? 'curse', 'courses'
      end

      def test_one_deletion_one_away
        assert one_away? 'board', 'bard'
      end

      def test_two_deletions_not_one_away
        refute one_away? 'moped', 'moe'
      end

      def test_insertion_and_deletion_not_one_away
        refute one_away? 'curses', 'course'
      end

      def test_reversed_not_one_away
        refute one_away? 'ab', 'ba'
      end

      private

      def one_away? source, target
        namespace.one_away? source, target
      end

      def problem
        Chapter01::Solution05
      end
    end

    class LinearTest < NamespaceConfigurable::Test
      include Tests
    end
  end
end
