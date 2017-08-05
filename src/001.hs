-- This can be solved in constant time with some closed sum formulae, but the
-- obvious list comprehension is super neat and plenty fast.

s001 = sum [n | n <- [1 .. 999], mod n 3 == 0 || mod n 5 == 0]
