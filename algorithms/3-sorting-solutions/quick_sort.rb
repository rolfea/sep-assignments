def quick_sort(array, start, finish)
  if start < finish
    p_index = partition(array, start, finish)
    quick_sort(array, start, p_index - 1)
    quick_sort(array, p_index + 1, finish)
  end
  return array
end

def partition(array, start, finish)
  pivot = array[finish]
  p_index = start
  for i in start..finish - 1
    if array[i] <= pivot
      array[i], array[p_index] = array[p_index], array[i]
      p_index += 1
    end
  end
  array[p_index], array[finish] = array[finish], array[p_index]
  return p_index
end

test_array = [22, 2, 3, 9, 5, 11, 7]
print quick_sort(test_array, 0, test_array.length - 1)
