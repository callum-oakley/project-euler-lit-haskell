> import Data.List.Ordered (minus)

> primesTo :: Integer -> [Integer]
> primesTo n = eratos [2 .. n]
>   where
>     eratos [] = []
>     eratos (p:xs) = p : eratos (minus xs [p ^ 2, p ^ 2 + p .. n])

Using our same `primesTo` function as in problem 007, the solution is trivial.

> s010 = sum $ primesTo $ 2 * 10 ^ 6 - 1
