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
end
