module Structure
  class LinkedList
    Node = Struct.new :data, :next

    def [] index
      fail IndexError, 'negative index' if index < 0
      fail IndexError, 'list empty'     if empty?
      index.times.reduce(@head) do |pointer, _|
        pointer.next or fail IndexError, 'too large'
      end.data
    end

    def head
      @head && @head.data
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

    private

    def empty?
      @head.nil?
    end
  end
end
