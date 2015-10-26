module Chapter01
  module Solution03
    module Linear; end
  end
end

module Chapter01::Solution03::Linear
  # rubocop:disable Metrics/AbcSize
  def self.urlify string, length
    queue = length.times.with_object [] do |i, q|
      string[i] == ' ' ? q << '%' << '2' << '0' : q << string[i]
      next if q.empty?
      string[i] = q.shift
    end
    queue.each_with_index { |c, i| string[length + i] = c }
    string
  end
  # rubocop:enable Metrics/AbcSize
end
