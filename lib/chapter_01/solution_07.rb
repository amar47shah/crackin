module Chapter01
  module Solution07
    module InPlace; end
    module OutOfPlace; end
  end
end

module Chapter01::Solution07::InPlace
  def self.rotate m
    whole_size = m.size
    whole_size.step(2, -2) do |ring_size|
      a = (whole_size - ring_size) / 2
      z = (whole_size + ring_size - 2) / 2
      0.upto(ring_size - 2) do |i|
        m[i + a][z], m[z][z - i], m[z - i][a], m[a][i + a] =
        m[a][i + a], m[i + a][z], m[z][z - i], m[z - i][a]
      end
    end
    m
  end
end

module Chapter01::Solution07::OutOfPlace
  class << self
    def rotate matrix
      reflect_horizontal transpose matrix
    end

    private

    def transpose matrix
      (0...matrix.size).reduce([]) do |transpose, column|
        transpose << matrix.flat_map { |row| row[column] }
      end
    end

    def reflect_horizontal matrix
      matrix.reduce([]) { |reflection, row| reflection << row.reverse }
    end
  end
end
