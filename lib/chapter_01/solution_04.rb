module Chapter01
  module Solution04
    module Linear; end
  end
end

module Chapter01::Solution04::Linear
  def self.palindrome_permutation? string
    string
      .each_char
      .with_object({}) { |c, odd_count| odd_count[c] = !odd_count[c] }
      .count { |_, bool| bool } < 2
  end
end
