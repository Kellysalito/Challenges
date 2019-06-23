
require 'test/unit'
require 'benchmark'

def recursive_fib(n )
  return  n  if n <= 1
  recursive_fib(n - 1 ) + recursive_fib(n - 2 )
end

def iterative_fib(n)
  return  n  if n <= 1

  inner_num = n - 1
  result = inner_num.times.each_with_object([0,1]) { |num, obj| obj << obj[-2] + obj[-1] }
  result.pop()
end

num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib")  { iterative_fib(num)  }
end

class TestFibonacci < Test::Unit::TestCase
  def test_zero_through_nine_recursive
    assert(recursive_fib(0) == 0)
    assert(recursive_fib(1) == 1)
    assert(recursive_fib(2) == 1)
    assert(recursive_fib(3) == 2)
    assert(recursive_fib(4) == 3)
    assert(recursive_fib(5) == 5)
    assert(recursive_fib(6) == 8)
    assert(recursive_fib(7) == 13)
    assert(recursive_fib(8) == 21)
    assert(recursive_fib(9) == 34)
  end

  def test_zero_through_nine_iterative
    assert(iterative_fib(0) == 0)
    assert(iterative_fib(1) == 1)
    assert(iterative_fib(2) == 1)
    assert(iterative_fib(3) == 2)
    assert(iterative_fib(4) == 3)
    assert(iterative_fib(5) == 5)
    assert(iterative_fib(6) == 8)
    assert(iterative_fib(7) == 13)
    assert(iterative_fib(8) == 21)
    assert(iterative_fib(9) == 34)
  end
end