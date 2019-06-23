require 'test/unit'

def collatz(input_number)
  length = 1
  if input_number <= 0
    raise ArgumentError.new 'Invalid.  Only positive numbers'
  end
  while input_number != 1
    length += 1
    input_number = input_number.even? ? (input_number / 2) : (input_number * 3 + 1)
  end
  length
end


class TestCollatz < Test::Unit::TestCase
  def test_collatz_sequence
    assert(collatz(1) == 1)
    assert(collatz(2) == 2)
    assert(collatz(3) == 8)
    assert(collatz(4) == 3)
    assert(collatz(5) == 6)
    assert(collatz(6) == 9)
    assert(collatz(7) == 17)
  end
end

def max_collatz
  largest_len = 0
  largest_number = 0
  (1..1000000).each do |n|
    length = collatz(n)
    if length > largest_len
      largest_len = length
      largest_number = n
    end
  end
  {:largest_number => largest_number, :largest_len => largest_len}
end