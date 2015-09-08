module Structure
  class HashTable
    Node = Struct.new :key, :value, :next

    def initialize size
      @array = Array.new size
    end

    def find key
      index = index_for key
      find_in_list_at index, key
    end

    def insert key, value
      index = index_for key
      node = Node.new key, value, nil
      insert_into_list_at index, node
    end

    private

    def find_in_list_at index, key
      current = @array[index]
      while current
        return current.value if current.key == key
        current = current.next
      end
    end

    def index_for key
      key.hash % @array.size
    end

    def insert_into_list_at index, node
      @array[index], node.next = node, @array[index]
    end
  end
end
