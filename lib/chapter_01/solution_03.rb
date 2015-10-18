module Chapter01
  module Solution03
    module Linear; end
  end
end

module Chapter01::Solution03::Linear
  def self.urlify string, length
    queue = (0...length).each_with_object [] do |i, q|
      string[i] == ' ' ? q << '%' << '2' << '0' : q << string[i]
      next if q.empty?
      string[i] = q.shift
    end
    queue.each_with_index { |c, i| string[length + i] = c }
    string
  end
end
