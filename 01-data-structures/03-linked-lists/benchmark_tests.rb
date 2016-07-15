require 'benchmark'
require_relative 'linked_list'
require_relative 'node'

test_array = Array.new
test_list = LinkedList.new

n = 10_000

Benchmark.bmbm do |x|
  x.report("Array: ") { for i in 1..n; test_array << i.to_s; end }
  x.report("Linked List: ") { for i in 1..n; test_list.add_to_tail(Node.new(i)); end }
  x.report("Access 5000 Array element: ") { test_array[4999] }
  x.report("Access 5000 Linked List element: ") { test_list.return_single(5000) }
  # x.report("Delete 5000th Array element: ") { test_array.delete_at(4999) }
  # x.report("Delete 5000th Linked List element: ") { test_list.delete()}
end
