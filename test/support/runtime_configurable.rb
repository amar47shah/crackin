module RuntimeConfigurable
  class Test < Minitest::Test
    private

    def namespace
      problem.const_get runtime
    end

    def problem
      fail NotImplementedError
    end

    def runtime
      fail NotImplementedError
    end
  end

  class QuadraticTest < Test
    private

    def runtime
      'Quadratic'
    end
  end

  class LinearithmicTest < Test
    private

    def runtime
      'Linearithmic'
    end
  end

  class LinearTest < Test
    private

    def runtime
      'Linear'
    end
  end
end
