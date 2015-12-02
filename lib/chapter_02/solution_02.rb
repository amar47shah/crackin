require_relative '../structure/linked_list'

module Chapter02
  module Solution02
    module Linear; end
  end
end

module Chapter02::Solution02::Linear
  class CountFromLast < Structure::LinkedList
    def from_last count
      fail ArgumentError, 'cannot be negative' if count < 0
      return if empty?
      leader = @head
      count.times { leader = leader.next or return }
      follower = @head
      while leader = leader.next
        follower = follower.next
      end
      follower.data
    end
  end
end
