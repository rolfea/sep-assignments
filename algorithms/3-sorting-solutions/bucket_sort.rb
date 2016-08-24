def bucket_sort(array, bucket_size)
  # Generates the buckets based on the spread in the array's values
  min_value = array.min
  max_value = array.max
  bucket_amount = ((max_value - min_value) / bucket_size).floor + 1

  buckets = Array.new(bucket_amount)
  buckets.each_index do |index|
    buckets[index] = []
  end

  # sorts the array's contents into appropriate buckets
  array.each_index do |index|
    buckets[((array[index] - min_value) / bucket_size).floor] << array[index]
  end

  array.clear
  buckets.each_index do |index|
    if !buckets[index].empty?
      buckets[index] = insertion_sort(buckets[index])
      buckets[index].each do |value|
        array << value
      end
    end
  end
  array
end

def insertion_sort(collection)
  sorted_collection = [collection.delete_at(0)]

  for val in collection
    sorted_collection_index = 0
    while sorted_collection_index < sorted_collection.length
      if val <= sorted_collection[sorted_collection_index]
        sorted_collection.insert(sorted_collection_index, val)
        break
      elsif sorted_collection_index == sorted_collection.length - 1
        sorted_collection.insert(sorted_collection_index + 1, val)
        break
      end
      sorted_collection_index += 1
    end
  end
  sorted_collection
end

test_array = [22, 2, 3, 9, 5, 11, 7]
print bucket_sort(test_array, 5)
print "\n"
