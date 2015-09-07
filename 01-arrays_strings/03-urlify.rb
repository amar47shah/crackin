module Linear
  def self.urlify string, length
    queue = []
    (0...length).each do |i|
      queue << '%' << '2' << '0' if string[i] == ' '
      unless queue.empty?
        queue << string[i] unless string[i] == ' '
        string[i] = queue.shift
      end
    end
    queue.each_with_index { |c, i| string[length + i] = c }
    string
  end
end
