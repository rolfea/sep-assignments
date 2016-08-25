def linear_search(array, value)
  input_size = 0
  return if array.empty?
  array.each_index do |i|
    input_size += 1
    if array[i] == value
      return "Value after #{i + 1} iterations. Input size was: #{input_size}"
    end
  end
end

test_array = [43]
puts linear_search(test_array, 43)
9.times do
  test_array.insert(0,0)
  puts linear_search(test_array, 43)
end
