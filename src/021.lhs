We'll modifying our `divisors` function from [solution 012](#012) to find only
the proper divisors of a given integer.

> intSqrt :: Integer -> Integer
> intSqrt = floor . sqrt . fromIntegral
>
> properDivisors :: Integer -> [Integer]
> properDivisors n =
>   [ d'
>   | d <- filter ((== 0) . mod n) [2 .. intSqrt n]
>   , d' <- if d ^ 2 == n then [d] else [d, div n d]
>   ]

Then `d` as defined in the problem is just

> d :: Integer -> Integer
> d = sum . properDivisors

`n` is amicable if there is some `m` such that

    m /= n && d n == m && d m == n

or, substituting `m` for `d n`

    d n /= n && d (d n) == n

so we can define

> isAmicable :: Integer -> Bool
> isAmicable n = d n /= n && d (d n) == n

and the solution is just

> s021 = sum $ filter isAmicable [1 .. 10000]
