def poorly_written_ruby(*arrays)
   combined_array = []
   arrays.each do |array|
     array.each do |value|
       combined_array << value
     end
   end
   # replaced sorting algorithm with Quick Sort, which has a better run time
   quick_sort(combined_array)
 end

def quick_sort(collection, from=0, to=nil)
   if to == nil
     # Sort the whole collection, by default
     to = collection.count - 1
   end

   if from >= to
     # Done sorting
     return
   end

   # Take a pivot value, at the far left
   pivot = collection[from]

   # Min and Max pointers
   min = from
   max = to

   # Current free slot
   free = min

   while min < max
     if free == min # Evaluate collection[max]
       if collection[max] <= pivot # Smaller than pivot, must move
         collection[free] = collection[max]
         min += 1
         free = max
       else
         max -= 1
       end
     elsif free == max # Evaluate collection[min]
       if collection[min] >= pivot # Bigger than pivot, must move
         collection[free] = collection[min]
         max -= 1
         free = min
       else
         min += 1
       end
     else
       raise "Inconsistent state"
     end
   end

   collection[free] = pivot

   quick_sort collection, from, free - 1
   quick_sort collection, free + 1, to

   collection
end
