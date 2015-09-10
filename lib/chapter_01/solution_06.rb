module Chapter01
  module Solution06
    module Linear; end
  end
end

module Chapter01::Solution06::Linear
  def self.compress string
    "#{string}$".each_char.reduce(['', string[0], 0]) do |(out, k, n), c|
      break [string] if out.length + 2 >= string.length
      c == k ? [out, k, n + 1] : ["#{out}#{k}#{n}", c, 1]
    end.first
  end
end
