require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head.nil?
      @head = node
      @tail = node
      return @tail
    end

    advance_through_list_until_next_is(nil)

    @current_node.next = node
    @tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head == @tail
      @tail = nil
      @head = nil
      return nil
    end

    advance_through_list_until_next_is(@tail)

    @tail = @current_node
    @tail.next = nil
  end

  # This method prints out a representation of the list.
  def print
    current_node = @head
    # if I rework this so the puts is elsewhere,
    # I can replace with the method advance_through_list_until_next_is(nil)
    until current_node.next.nil?
      puts current_node.data
      current_node = current_node.next
    end
    puts @tail.data
  end


  def return_single(element_location)
    current_node = @head
    # use 0
    counter = 1
    until counter == element_location
      current_node = current_node.next
      counter += 1
    end
    current_node.next
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    # removes head
    if node == @head
      temp_node = @head.next
      @head.next = nil
      @head = temp_node
      return
    end
    # removes tail
    if node == @tail
      advance_through_list_until_next_is(@tail)
      @current_node.next = nil
      @tail = @current_node
      return
    end
    # removes from middle
    advance_through_list_until_next_is(node)
    @current_node.next = node.next
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head.nil?
      @head = node
      @tail = node
      return @tail
    end

    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    removed_head = @head
    if @head.next == nil
      @head = nil
      @tail = nil
      removed_head
    else
      new_head = @head.next
      @head.next = nil
      @head = new_head
      removed_head
    end
  end

  def advance_through_list_until_next_is(target)
    # instead just return this
    @current_node = @head
    until @current_node.next == target
      @current_node = @current_node.next
    end
  end
end
