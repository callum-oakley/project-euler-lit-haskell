import Data.List.Ordered (minus)

primesTo n = eratos [2 .. n]
  where
    eratos [] = []
    eratos (p:xs) = p : eratos (minus xs [p * p, p * p + p .. n])

s007 = primesTo (2 ^ 17) !! 10000
