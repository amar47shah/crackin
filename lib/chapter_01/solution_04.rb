module Chapter01
  module Solution04
    module Linear; end
  end
end

module Chapter01::Solution04::Linear
  def self.palindrome_permutation? string
    string.each_char
          .reduce({}) { |h, c| h[c] = !h[c]; h }
          .count { |_, v| v } < 2
  end
end
