module Quadratic
  def self.unique_characters? string
    characters = string.chars
    characters.each_with_index do |c, i|
      return false if (0...i).any? { |j| characters[j] == c }
    end
    true
  end
end

module Linearithmic
  def self.unique_characters? string
    characters = string.chars.sort
    characters.each_with_index do |c, i|
      return false if characters.binary_search c, max: i - 1
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

class Array
  # requires array to be pre-sorted in ascending order
  def binary_search value, min: 0, max: size - 1
    return false if min > max
    midpoint = (min + max) / 2
    case value <=> self[midpoint]
    when -1 then binary_search value, min: min, max: midpoint - 1
    when  0 then true
    when  1 then binary_search value, min: midpoint + 1, max: max
    end
  end
end
