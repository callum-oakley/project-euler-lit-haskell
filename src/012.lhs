First we're going to need a function for calculating divisors.

> import Data.Set (Set)
> import qualified Data.Set as Set
>
> divisors :: Integer -> Set Integer
> divisors n = Set.fromList $ smallDivisors ++ bigDivisors
>   where
>     intSqrt = floor . sqrt . fromIntegral
>     smallDivisors = filter ((== 0) . mod n) [1 .. intSqrt n]
>     bigDivisors = map (div n) smallDivisors

And a list of triangular numbers.

> triangles :: [Integer]
> triangles = [div (n * (n + 1)) 2 | n <- [1 ..]]

There's surely some way to apply a more "dynamic programming" approach to this
and cut down on redundant calculations – but this naive approach gets to the
right answer on my machine in about 10s so we'll leave it as is.

> s012 = head $ filter ((> 500) . Set.size . divisors) $ triangles
