require_relative '../structure/linked_list'

module Chapter02
  module Solution03
    module Linear; end
  end
end

module Chapter02::Solution03::Linear
  class DeleteFirstMatch < Structure::LinkedList
    def delete_first data
      return if empty?
      return pop if head == data
      previous = current = @head
      while current = current.next
        return snip_after previous if current.data == data
        previous = current
      end
    end
  end
end
