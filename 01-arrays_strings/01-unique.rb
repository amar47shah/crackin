module Quadratic
  def self.unique_characters? string
    characters = string.chars
    characters.each_with_index do |c, i|
      return false if (0...i).any? { |j| characters[j] == c }
    end
    true
  end
end

module Linear
  def self.unique_characters? string
    characters = string.chars
    h = {}
    characters.each do |c|
      return false if h[c]
      h[c] = true
    end
    true
  end
end
