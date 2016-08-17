# def quick_sort(collection, from, to)
#   if collection[from..to].length <= 1
#     return
#   end
#
#   pivot_value = collection[to]
#   pivot_index = to
#
#   for i in from..to - 1
#     if collection[i] > collection[pivot_index]
#       collection << collection[i]
#       collection.delete_at(i)
#     end
#   end
#
#   print collection
#   quick_sort(collection, from, pivot_index - 1)
#   quick_sort(collection, pivot_index + 1, to)
# end
#
# test_array = [5,3,1,2,6,7,4]
# quick_sort(test_array, 0, test_array.length - 1)


def quickSort(arr,from,to)
    return if from >= to
    pivot = arr[from]
    i = from
    for j in (1+from)..to
        if arr[j] < pivot
            i = i + 1
            temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
        end
    end
    quickSort(arr,from,i-1);
    quickSort(arr,i+1,to);
end


original_array=[2,19,5,4,3,14,2]
puts "Sorted Array Using Quick Sort:"
quickSort(original_array,0,original_array.length - 1)
p original_array
