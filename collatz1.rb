def collatz_sequence(num)
  raise "Zero is invalid" if num == 0
  return [1] if num == 1
  results = []
  if num.even?
    results << collatz_sequence(num / 2).insert(0, num)
  else
    results << collatz_sequence(num*3 + 1).insert(0, num)
  end
  results.flatten
end
 puts collatz_sequence (7)
