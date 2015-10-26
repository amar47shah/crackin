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
      zero[:cols].each { |col| matrix.each { |row| row[col] = 0 } }
      matrix
    end

    private

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def zero_locations matrix
      n = matrix.size
      m = matrix.first.size
      zero_vectors =
        n.times.with_object([[false] * n, [false] * m]) do |i, (r_zero, c_zero)|
          m.times do |j|
            next unless matrix[i][j].zero?
            r_zero[i] = true
            c_zero[j] = true
          end
        end
      zero_indexes =
        zero_vectors.map { |v| v.map.with_index.select(&:first).map(&:last) }
      Hash[%i(rows cols).zip zero_indexes]
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
end

module Chapter01::Solution08::Version02
  def self.flow_zeroes matrix
    columns = matrix.each_with_object({}) do |row, zero_columns|
      zero_indexes = row.map.with_index.select { |n, _| n.zero? }.map(&:last)
      zero_indexes.each { |c| zero_columns[c] = :zero }
      row.fill(0) unless zero_indexes.empty?
    end
    columns.keys.each { |column| matrix.each { |row| row[column] = 0 } }
    matrix
  end
end

module Chapter01::Solution08::Version03
  def self.flow_zeroes matrix
    columns = matrix.reduce [] do |zero_columns, row|
      zero_indexes = row.map.with_index.select { |n, _| n.zero? }.map(&:last)
      row.fill(0) unless zero_indexes.empty?
      zero_columns + zero_indexes
    end
    columns.uniq.each { |column| matrix.each { |row| row[column] = 0 } }
    matrix
  end
end
