module Chapter01
  module Solution08
    module Version01; end
    module Version02; end
    module Version03; end
  end
end


module Chapter01::Solution08::Version01
  class << self
    def flow_zeroes matrix
      zero = zero_locations matrix
      zero[:rows].each { |row| matrix[row].fill(0) }
      zero[:columns].each { |column| matrix.each { |row| row[column] = 0 } }
      matrix
    end

    private

    def zero_locations matrix
      n, m = matrix.size, matrix.first.size
      zero_vectors =
        (0...n).reduce([[false] * n, [false] * m]) do |(row_zero, column_zero), i|
          (0...m).each do |j|
            next unless matrix[i][j].zero?
            row_zero[i]    = true
            column_zero[j] = true
          end
          [row_zero, column_zero]
        end
      zero_indexes =
        zero_vectors.map { |v| v.map.with_index.select(&:first).map(&:last) }
      Hash[%i(rows columns).zip zero_indexes]
    end
  end
end

module Chapter01::Solution08::Version02
  def self.flow_zeroes matrix
    matrix.reduce({}) do |columns, row|
      zero_indexes = row.map.with_index.select { |n, _| n.zero? }.map(&:last)
      zero_indexes.each { |c| columns[c] = :zero }
      row.fill(0) unless zero_indexes.empty?
      columns
    end.keys.each { |column| matrix.each { |row| row[column] = 0 } }
    matrix
  end
end

module Chapter01::Solution08::Version03
  def self.flow_zeroes matrix
    matrix.reduce([]) do |zero_columns, row|
      zero_indexes = row.map.with_index.select { |n, _| n.zero? }.map(&:last)
      row.fill(0) unless zero_indexes.empty?
      zero_columns + zero_indexes
    end.uniq.each { |column| matrix.each { |row| row[column] = 0 } }
    matrix
  end
end
