class ArrayList
  attr_reader :size

  def initialize capacity = 1
    @capacity = capacity
    @array = Array.new @capacity
    @size = 0
  end

  def push value
    @array[@size] = value
    increment_size
    self
  end

  def value_at index
    fail ArgumentError, 'index out of bounds' unless 0 <= index && index < @size
    @array[index]
  end

  private

  def increment_size
    @size += 1
    double_capacity if @size > @capacity
  end

  def double_capacity
    @capacity *= 2
    new_array = Array.new @capacity
    @array.each_with_index { |item, index| new_array[index] = item }
    @array = new_array
  end
end
