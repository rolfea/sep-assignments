class PrintQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def enqueue(element)
    new_array = []
    new_array[0] = element

    @queue.each do |element|
      new_array << element
    end
    @queue = new_array
    set_head_and_tail
  end

  def dequeue
    
  end

  def set_head_and_tail
    @head = @queue[0]
    @tail = @queue[-1]
  end
end
