require 'structure/array_list'

module Structure
  class StringBuilder
    def initialize string = ''
      @strings = ArrayList.new
      append string
    end

    def append string
      @strings.push string
    end

    def to_s
      @strings.size.times.with_object('') { |i, s| s << @strings.value_at(i) }
    end
  end
end
