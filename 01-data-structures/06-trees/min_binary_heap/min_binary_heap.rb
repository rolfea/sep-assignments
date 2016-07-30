require_relative 'node.rb'

class MinBinaryHeap
  attr_accessor :heap

  def initialize(root)
    @heap = [root]
  end

  def insert(root, data)
    @heap << data
    child_index = @heap.size - 1
    swap_up(child_index)
  end

  def find(root, data)
    @heap.each do |node|
      if node.rating == data.rating
        return node
      end
    end
    return nil
  end

  def delete(root, data)
    delete_index = @heap.find_index(data)
    left_node = 2 * delete_index + 1
    right_node = 2 * delete_index + 2
    if @heap[left_node] == nil && @heap[right_node] == nil
      @heap.delete_at(delete_index)
    else
      @heap[delete_index] = @heap[-1]
      @heap.delete_at(-1)
      if @heap[left_node] != nil
        swap_up(left_node)
      else
        swap_up(right_node)
      end
    end
  end

  def print
    queue = [@heap[0]]
    returned_string = ""

    until queue.empty?
      temp_root = queue.shift
      temp_root_index = @heap.find_index(temp_root)
      left_node = 2 * temp_root_index + 1
      right_node = 2 * temp_root_index + 2
      unless @heap[left_node] == nil
        queue << @heap[left_node]
      end
      unless @heap[right_node] == nil
        queue << @heap[right_node]
      end
      returned_string << "#{temp_root.title}: #{temp_root.rating}\n"
    end
    puts returned_string
  end

  def swap_up(child_index)
    parent_index = ((child_index - 1) / 2).floor
    if child_index == 0
      return
    elsif @heap[child_index].rating >= @heap[parent_index].rating
      return
    else
      @heap[parent_index], @heap[child_index] = @heap[child_index], @heap[parent_index]
      swap_up(parent_index)
    end
  end
end
