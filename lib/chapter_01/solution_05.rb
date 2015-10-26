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
      insertions = source.each_char.with_index.reduce(0) do |distance, (c, i)|
        break distance if distance > 1
        distance + (c == target[i + distance] ? 0 : 1)
      end
      insertions == 1
    end

    def one_replacement_away? source, target
      return false unless source.length == target.length
      pairs = source.each_char.zip target.chars
      pairs.count { |original, replaced| original != replaced } == 1
    end
  end
end
