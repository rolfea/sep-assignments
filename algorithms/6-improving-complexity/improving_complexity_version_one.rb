# Code Optimizations: Used built-in ruby methods that improve readbility
def poorly_written_ruby(*arrays)
  combined_array = arrays[0]
  (1..arrays.length - 1 ).each do |i|
  	combined_array.concat(arrays[i])
  end
  combined_array.sort!
end

# O(n + n log n)
