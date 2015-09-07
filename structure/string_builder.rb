require_relative './array_list'

class StringBuilder
  def initialize string = ''
    @strings = ArrayList.new
    append string
  end

  def append string
    @strings.push string
  end

  def to_s
    (0...@strings.size).reduce('') { |s, i| s << @strings.value_at(i) }
  end
end
