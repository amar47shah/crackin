module Chapter01
  module Solution05
    module Linear; end
  end
end

module Chapter01::Solution05::Linear
  class << self
    def one_away? source, target
      [
        source == target,
        one_insertion_away?(source, target),
        one_replacement_away?(source, target),
        one_insertion_away?(target, source)
      ].any?
    end

    private

    def one_insertion_away? source, target
      return false unless target.length - source.length == 1
      insertions = (0...source.length).reduce(0) do |d, i|
                     break d if d > 1
                     d + (source[i] == target[i + d] ? 0 : 1)
                   end
      insertions == 1
    end

    def one_replacement_away? source, target
      return false unless source.length == target.length
      replacements = (0...source.length).reduce(0) do |d, i|
                       d + (source[i] == target[i] ? 0 : 1)
                     end
      replacements == 1
    end
  end
end
