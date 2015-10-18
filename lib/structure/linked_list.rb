module Structure
  class LinkedList
    Node = Struct.new :data, :next

    def [] index
      fail IndexError, 'negative'   if index < 0
      fail IndexError, 'list empty' if empty?
      index.times.reduce @head do |pointer, _|
        pointer.next or fail IndexError, 'too large'
      end.data
    end

    def delete index
      fail IndexError, 'negative'   if index < 0
      fail IndexError, 'list empty' if empty?
      if index == 0
        data = @head.data
        @head = @head.next
        return data
      end
      previous = (index - 1).times.reduce @head do |pointer, _|
        pointer.next or fail IndexError, 'too large'
      end
      fail IndexError, 'too large' unless previous.next
      data = previous.next.data
      previous.next = previous.next.next
      data
    end

    def empty?
      @head.nil?
    end

    def head
      @head && @head.data
    end

    def index data
      pointer = @head
      counter = 0
      until pointer.nil? || pointer.data == data do
        pointer = pointer.next
        counter += 1
      end
      pointer && counter
    end

    def insert data
      @head = Node.new data, @head
      self
    end
  end
end
