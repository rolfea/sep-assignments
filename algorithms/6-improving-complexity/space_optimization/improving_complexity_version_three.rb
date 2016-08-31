require_relative 'linked_list'

def merge_sort(collection)
   if collection.length <= 1
     collection
   else
     mid = (collection.length / 2).floor
     left = merge_sort(collection[0..mid - 1])
     right = merge_sort(collection[mid..collection.length])
     merge(left, right)
   end
end
