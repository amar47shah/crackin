require_relative '../structure/linked_list'

module Chapter02
  module Solution01
    module Linear; end
  end
end

module Chapter02::Solution01::Linear
  class UniqueList < Structure::LinkedList
    def remove_duplicates
      return self if empty?
      found = { head => true }
      previous = @head
      while current = previous.next
        next snip_after previous if found[current.data]
        found[current.data] = true
        previous = current
      end
      self
    end
  end
end
