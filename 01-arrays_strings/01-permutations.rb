module Linearithmic
  def self.permutations? left, right
    return false unless left.length == right.length
    left.chars.sort == right.chars.sort
  end
end

module Linear
  class << self
    def permutations? left, right
      return false unless left.length == right.length
      left_counts  = character_counts left
      right_counts = character_counts right
      left_counts.all? { |character, count| count == right_counts[character] }
    end

    private

    def character_counts string
      string.chars.reduce(Hash.new 0) { |counts, c| counts[c] += 1 ; counts }
    end
  end
end
