require 'benchmark'
require_relative 'quick_sort.rb'
require_relative 'bucket_sort.rb'
require_relative 'heap_sort/heap.rb'

# generated this with rand(51)
test_array = [23, 20, 50, 19, 16, 49, 2, 22, 29, 44, 43, 6, 12, 9, 19, 5, 0, 10,
  3, 32, 43, 42, 0, 13, 45, 13, 40, 35, 25, 17, 41, 36, 5, 19, 9, 9, 6, 19, 35,
  50, 30, 25, 6, 22, 11, 31, 5, 10, 41, 12, 10000]

test_heap = MaxHeap.new(test_array)

Benchmark.bmbm do |x|
  x.report("Quick Sort") { quick_sort(test_array, 0, test_array.length - 1) }
  x.report("Heap Sort") { test_heap.build_max_heap; test_heap.heap_sort }
  x.report("Bucket Sort") { bucket_sort(test_array, 5) }
end

# The benchmark tests show quick sort actually performing the worst of the three of these sorts.
# I imagine this has to do with either a flaw in my implementation, or the material sorted.
# For example, Bucket Sort will perform very well when there is a consistent spread in the values to be sorted,
# but throwing a single high values into the mix (10000) raised the execution time from 1.04**-4 to 3.7**-4.
