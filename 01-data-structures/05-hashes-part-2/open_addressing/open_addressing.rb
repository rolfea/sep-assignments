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

    if @items[hash_index] == nil
      puts "Inserting #{key} at #{hash_index}"
      @items[hash_index] = node
      @item_count += 1
    # elsif @items[hash_index].key == key && next_open_index(hash_index) != -1
    #   return
    # elsif @items[hash_index].key == key
    #   self.resize
    #   return
    else
      open_index = next_open_index(hash_index)
      if open_index == -1
        puts "Resizing the array"
        self.resize
        self[key] = value
        return
      else
        puts "Found open index at #{open_index}"
        @items[open_index] = node
        @item_count += 1
      end
    end
  end

  def [](key)
    hash_index = index(key, @items.size)
    search_index = 0
    puts "Checking #{hash_index} for #{key}"

    if @items[hash_index] == nil
      return nil
    elsif @items[hash_index].key == key
      puts "Found at #{hash_index}"
      return @items[hash_index].value
    else
      hash_index == @items.size - 1 ? search_index = 0 : search_index = hash_index + 1
      while search_index != hash_index
        if @items[search_index] == nil
          return nil
        elsif @items[search_index].key == key
          puts "Found at #{search_index}"
          return @items[search_index].value
        else
          search_index == @items.size - 1 ? search_index = 0 : search_index += 1
        end
      end
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
    counter = index
    while @items[counter] != nil
      if counter == @items.size - 1
        return -1
      else
        counter += 1
      end
    end
    return counter
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    new_hash_size = size * 2
    new_array = Array.new(new_hash_size)
    saved_items = []

    @items.each do |item|
      unless item == nil
        saved_items << item
      end
    end
    # new, doubled, and all-nil array
    @items = new_array

    saved_items.each do |item|
      self[item.key] = item.value
    end
  end

  def print_state
    (0..@items.size - 1).each do |i|
      if @items[i] == nil
        puts "#{i}: nil"
      else
        puts "#{i} (#{@items[i].key}): #{@items[i].value}"
      end
    end

    load_factor = @item_count / (self.size.to_f)
    puts "Load Factor: #{load_factor}"
  end
end
