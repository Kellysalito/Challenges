def collatz_sequence (n)
  new_arr = [] 
 until n == 1 
  if n%2 != 0
    n = 3*n + 1
    new_arr.push(n)
  else
    n = n/2
    new_arr.push(n)
 end
  end
return new_arr

end

puts collatz_sequence(7)