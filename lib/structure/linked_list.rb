module Structure
  class LinkedList
    Node = Struct.new :data, :next

    def head
      @head && @head.data
    end

    def [] index
      fail IndexError, 'negative index' if index < 0
      index.times.reduce(@head) do |pointer, _|
        fail IndexError, 'index too large' unless pointer
        pointer.next
      end.data
    end

    def index data
      pointer = @head
      counter = 0
      while pointer && pointer.data != data do
        pointer = pointer.next
        counter += 1
      end
      pointer && counter
    end

    def insert data
      @head = Node.new(data, @head)
      self
    end
  end
end
