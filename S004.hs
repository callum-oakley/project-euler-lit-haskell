isPalindromic :: Show a => a -> Bool
isPalindromic x = show x == (reverse . show) x

s004 =
  maximum $ filter isPalindromic $ [x * y | x <- [100 .. 999], y <- [x .. 999]]
