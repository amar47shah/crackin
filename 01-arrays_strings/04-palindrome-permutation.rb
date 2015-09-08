module Linear
  def self.palindrome_permutation? string
    string.chars.reduce({}) { |h, c| h[c] = !h[c] ; h }.count { |_, v| v } < 2
  end
end
