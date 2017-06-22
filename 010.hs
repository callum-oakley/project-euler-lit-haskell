import Data.List.Ordered (minus)

primesTo n = eratos [2 .. n]
  where
    eratos [] = []
    eratos (p:xs) = p : eratos (minus xs [p * p, p * p + p .. n])

s010 = sum $ primesTo $ 2 * 10 ^ 6 - 1
