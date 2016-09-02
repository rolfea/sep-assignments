require_relative 'linked_list'

# is passing the whole object defeating the space benefits of the linked list?
def sort_list(head_node)
  # check is list is empty or a single item
  return head_node if head_node.nil? || head_node.next.nil?
  # find the middle node and split the list into two halves
  middle_node_location = ((@length / 2).floor) - 1
  middle_node = return_single(middle_node_location)
  head_of_second_half = return_single(middle_node_location + 1)
  # split the list
  middle_node.next = nil

  #merge the results of recursive calls to sort function (merge sort)
  merge(sort_list(head_node), sort_list(head_of_second_half)
end

def merge(node1, node2)
  pointer_node = Node.new
  if node1.nil?
    node2
  elsif node2.nil?
    node1
  elsif node1.data < node2.data

end

def merge(left, right)
   if left.empty?
     right
   elsif right.empty?
     left
   elsif left.first < right.first
     [left.first] + merge(left[1..left.length], right)
   else
     [right.first] + merge(left, right[1..right.length])
   end
 end
