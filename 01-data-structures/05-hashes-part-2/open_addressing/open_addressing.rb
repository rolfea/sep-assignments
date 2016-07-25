require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @item_count = 0
  end

  def []=(key, value)
    puts "-" * 10
    puts "Entry is #{key}"
    hash_index = index(key, @items.size)
    node = Node.new(key, value)
    puts "Generated index is: #{hash_index}"
    puts next_open_index(hash_index)

    if next_open_index(hash_index) == -1
      self.resize
      puts "After resize, array is: "
      @items.each do |item|
        unless item == nil
          puts "#{item.key} #{index(item.key, @items.size)}"
        end
      end
      self[key] = value
      return
    else
      @items[next_open_index(hash_index)] = node
      @item_count += 1
    end
  end

  def [](key)
    hash_index = index(key, @items.size)
    if @items[hash_index] == nil
      return "Error occurred: value is nil"
    else
      @items[hash_index].value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    ascii_sum = 0
    key.split("").each do |word|
      ascii_sum += word.ord
    end
    ascii_sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    if @items[index] == nil
      return index
    elsif index == @items.size - 1 && @items[index] != nil
      return -1
    elsif @items[index] != nil
      index += 1
      next_open_index(index)
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    new_hash_size = size * 2
    new_array = Array.new(new_hash_size)

    (0..@items.size-1).each do |i|
      item = @items[i]
      unless item == nil
        new_index = index(item.key, new_array.size)
        puts "#{@items[i].key} new index is : #{new_index}"
        new_array[new_index] = item
      end
    end
    @items = new_array
  end

  def print_state
    (0..@items.size - 1).each do |i|
      if @items[i] == nil
        puts "#{i}: nil"
      else
        puts "#{i}: #{@items[i].value}"
      end
    end

    load_factor = @item_count / (self.size.to_f)
    puts "Load Factor: #{load_factor}"
  end
end
