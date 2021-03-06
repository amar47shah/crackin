module Chapter01
  module Solution01
    module Quadratic; end
    module Linearithmic; end
    module Linear; end
  end
end

module Chapter01::Solution01::Quadratic
  def self.unique_characters? string
    characters = string.chars
    characters.all? { |c| characters.count { |cc| cc == c } == 1 }
  end
end

module Chapter01::Solution01::Linearithmic
  def self.unique_characters? string
    characters = string.chars.sort
    characters.each_with_index.all? do |c, i|
      !characters.binary_search? c, max: i - 1
    end
  end
end

module Chapter01::Solution01::Linear
  def self.unique_characters? string
    string.each_char.with_object({}).all? { |c, h| !h[c] and h[c] = true }
  end
end

class Array
  # requires array to be pre-sorted in ascending order
  def binary_search? value, min: 0, max: size - 1
    return false if min > max
    midpoint = (min + max) / 2
    case value <=> self[midpoint]
    when -1 then binary_search? value, min: min, max: midpoint - 1
    when  0 then true
    when  1 then binary_search? value, min: midpoint + 1, max: max
    end
  end
end
