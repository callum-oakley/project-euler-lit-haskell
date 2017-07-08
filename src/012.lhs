First we're going to need a function for calculating divisors. We'll just check
each potential divisor up to the square root, adding a pair of divisors at a
time (aside from when `n` is square).

> intSqrt :: Integer -> Integer
> intSqrt = floor . sqrt . fromIntegral

> divisors :: Integer -> [Integer]
> divisors n =
>   [ d'
>   | d <- filter ((== 0) . mod n) [1 .. intSqrt n]
>   , d' <- if d ^ 2 == n then [d] else [d, div n d]
>   ]

The list of all triangular numbers is a neat scan.

> triangles :: [Integer]
> triangles = scanl1 (+) [0 ..]

Finally just find the first triangular number with more than 500 divisors.

> s012 = head $ filter ((> 500) . length . divisors) $ triangles
