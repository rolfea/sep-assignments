require 'benchmark'

def fib(n)
   if (n == 0)
     # #1
     return 0
   elsif (n == 1)
     # #2
     return 1
   else
     # #3
     return fib(n-1) + fib(n-2)
   end
 end

 def iterative_fib(n)
   if n == 0
     return nil
   elsif n == 1
     return 0
   else
     counter = 1
     ten_returned = [0, 1]
     while counter < n
       next_number = ten_returned[-1] + ten_returned[-2]
       ten_returned << next_number
       counter += 1
     end
     return ten_returned[-1]
   end
 end

 Benchmark.bmbm do |x|
   x.report("recursive: ") { fib(30) }
   x.report("iterative: ") { iterative_fib(30) }
 end
