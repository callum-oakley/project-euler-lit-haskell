> isPalindromic :: Show a => a -> Bool
> isPalindromic x = show x == (reverse . show) x

The only minor optimisation beyond the obvious here is assuming wlog that
`x <= y`, note `y <- [x .. 999]`.

> s004 =
>   maximum $ filter isPalindromic [x * y | x <- [100 .. 999], y <- [x .. 999]]
