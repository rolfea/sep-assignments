def quick_sort(array, start, finish)
  if start < finish
    p_index = partition(array, start, finish)
    quick_sort(array, start, p_index - 1)
    quick_sort(array, p_index + 1, finish)
  end
  array
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
  p_index
end
