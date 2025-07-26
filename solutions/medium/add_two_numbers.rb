# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
# [2, 4, 3] + [5, 6, 4]
def add_two_numbers(l1, l2)
  result = ListNode.new(0) # dummy node
  current = result
  carry = 0

  until l1.nil? && l2.nil? && carry.zero?
    sum = carry # [0]
    sum += l1&.val || 0 # [2, 4, 3]
    sum += l2&.val || 0 # [5, 6, 4]

    current.next = ListNode.new(sum % 10) # [7, 0, 8]
    current = current.next
    carry = sum / # [0, 1, 0]

    l1 = l1&.next
    l2 = l2&.next
  end
  # [0] -> [7] -> [0] -> [8] -> nil
  result.next
end

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end
