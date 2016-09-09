require_relative 'node.rb'

# is passing the whole object defeating the space benefits of the linked list?
def sort_list(head_node)
  # check is list is empty or a single item
  return head_node if head_node.nil? || head_node.next.nil?
  # find the middle node and split the list into two halves
  middle_node = get_middle_node(head_node)
  # split the list
  middle_node.next = nil
  #merge the results of recursive calls to sort function (merge sort)
  merge(sort_list(head_node), sort_list(head_of_second_half)
end

def merge(list_1, list_2)
  merged_list = Node.new
  # checks for single nodes
  if list_1.data.nil?
    list_2
  elsif list_2.data.nil?
    list_1
  end
  # recursive sort of items in micro-lists
  if list_1.data <= list_2.data
    merged_list = list_1
    merged_list.next = merge(list_1.next, list_2)
  else
    merged_list = list_2
    merged_list.next = merge(list_1, list_2.next)
  end
  return merged_list
end

# fix to be recursive
def get_middle_node(head_node)
  slow_pointer = head_node
  fast_pointer = head_node.next

  while fast != nil
    fast_pointer = fast_pointer.next
    if fast_pointer != nil
      slow_pointer = slow_pointer.next
      fast_pointer = fast_pointer.next
    end
  end
  slow_pointer
end
