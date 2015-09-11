module NamespaceConfigurable
  class Test < Minitest::Test
    private

    def namespace
      problem.const_get module_name
    end

    def problem
      fail NotImplementedError
    end

    def module_name
      fail NotImplementedError
    end
  end

  class QuadraticTest < Test
    private

    def module_name
      'Quadratic'
    end
  end

  class LinearithmicTest < Test
    private

    def module_name
      'Linearithmic'
    end
  end

  class LinearTest < Test
    private

    def module_name
      'Linear'
    end
  end

  class InPlaceTest < Test
    private

    def module_name
      'InPlace'
    end
  end

  class OutOfPlaceTest < Test
    private

    def module_name
      'OutOfPlace'
    end
  end
end
