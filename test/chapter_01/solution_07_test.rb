require_relative '../test_helper'
require_relative '../support/namespace_configurable'
require_relative '../../lib/chapter_01/solution_07'

module Chapter01Tests
  module Solution07
    module Tests
    end

    class InPlaceTest < NamespaceConfigurable::InPlaceTest
      include Tests
    end

    class OutOfPlaceTest < NamespaceConfigurable::OutOfPlaceTest
      include Tests
    end
  end
end
