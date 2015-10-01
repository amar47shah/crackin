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
      self.class.to_s.split('::').last.sub('Test', '')
    end
  end

  QuadraticTest    = Class.new Test
  LinearithmicTest = Class.new Test
  LinearTest       = Class.new Test
  InPlaceTest      = Class.new Test
  OutOfPlaceTest   = Class.new Test
end
