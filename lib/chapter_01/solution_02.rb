module Chapter01
  module Solution02
    module Linearithmic; end
    module Linear; end
  end
end

module Chapter01::Solution02::Linearithmic
  def self.permutations? left, right
    return false unless left.length == right.length
    left.chars.sort == right.chars.sort
  end
end

module Chapter01::Solution02::Linear
  class << self
    def permutations? left, right
      return false unless left.length == right.length
      left_counts  = character_counts left
      right_counts = character_counts right
      left_counts.all? { |character, count| count == right_counts[character] }
    end

    private

    def character_counts string
      string.chars.each_with_object(Hash.new 0) { |c, counts| counts[c] += 1 }
    end
  end
end
