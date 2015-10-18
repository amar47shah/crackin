module Structure
  class LinkedList
    Node = Struct.new :data, :next

    def [] index
      check_negative index
      check_empty_list
      node = node_at index
      node.data
    end

    def delete index
      check_negative index
      check_empty_list
      return pop if index.zero?
      previous = node_at index - 1
      snip_after previous
    end

    def empty?
      @head.nil?
    end

    def head
      @head.data unless empty?
    end

    def index data
      pointer = @head
      counter = 0
      until pointer.nil? || pointer.data == data
        pointer = pointer.next
        counter += 1
      end
      pointer && counter
    end

    def insert data
      @head = Node.new data, @head
      self
    end

    def pop
      data = @head.data
      @head = @head.next
      data
    end

    private

    def check_empty_list
      empty? and fail IndexError, 'list empty'
    end

    def check_negative index
      index < 0 and fail IndexError, 'negative'
    end

    def fail_out_of_bounds
      fail IndexError, 'too large'
    end

    def node_at index
      index.times.reduce(@head) { |node, _| node.next or fail_out_of_bounds }
    end

    def snip_after node
      after = node.next or fail_out_of_bounds
      node.next = after.next
      after.data
    end
  end
end