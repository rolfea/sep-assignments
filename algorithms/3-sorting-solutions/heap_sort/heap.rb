class MaxHeap
  attr_accessor :heap_array, :heap_range

  def initialize(unsorted_array)
    @heap_array = unsorted_array
    @heap_range = @heap_array.length - 1
  end

  def build_max_heap
    for i in ((@heap_range) / 2).downto(0)
      max_heapify(@heap_array, i)
    end
  end

  def max _heapify(array, index)
    left_child = left_child_value(array, index)
    puts "left_child: #{left_child}"
    right_child = right_child_value(array, index)
    puts "right_child: #{right_child}"

    if !left_child.nil? && left_child > array[index]
      array[index], array[left_child_index(index)] = array[left_child_index(index)], array[index]
      max_heapify(array, left_child_index(index))
    end
    if !right_child.nil? && right_child > array[index]
      array[index], array[right_child_index(index)] = array[right_child_index(index)], array[index]
      max_heapify(array, right_child_index(index))
    end
    return array
  end

  def heap_sort
    until @heap_range == 0
      @heap_array[0], @heap_array[@heap_range] = @heap_array[@heap_range], @heap_array[0]
      @heap_range -= 1
      @heap_array = max_heapify(@heap_array[0..@heap_range], 0) + @heap_array[@heap_range + 1..-1]
    end
    return @heap_array
  end

  def left_child_value(array, index)
    array[left_child_index(index)]
  end

  def right_child_value(array, index)
    array[right_child_index(index)]
  end

  def left_child_index(index)
    2 * index + 1
  end

  def right_child_index(index)
    2 * index + 2
  end

  def is_leaf_node?(array, index)
    return index >= array.length / 2
  end

  def satisfies_max_heap?
    return @heap_array[self] >= left_child_value(self) && @heap_array[self] >= right_child_value(self)
  end
end
