-- The `reverse` builtin makes writing an `isPalindromic` function trivial for
-- any type implementing `Show`.

isPalindromic :: Show a => a -> Bool
isPalindromic x = show x == (reverse . show) x

-- The only minor optimisation worth note here is assuming without loss of
-- generality that `x <= y`.

s004 = maximum $ filter isPalindromic
  [ x * y
  | x <- [100 .. 999]
  , y <- [x .. 999]
  ]
