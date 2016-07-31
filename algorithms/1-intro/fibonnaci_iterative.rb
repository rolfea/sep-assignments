def fib(n)
  if n == 0
    return nil
  elsif n == 1
    puts 0
  else
    counter = 2
    ten_returned = [0, 1]
    while counter < n
      next_number = ten_returned[-1] + ten_returned[-2]
      ten_returned << next_number
      counter += 1
    end
    puts ten_returned.join(" ")
  end
end

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)
