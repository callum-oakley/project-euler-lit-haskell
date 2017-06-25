Assume without loss of generality that `a <= b <= c`, and then find all such
triplets with a list comprehension.

> tripletsWithPerimeter :: Integer -> [[Integer]]
> tripletsWithPerimeter n =
>   [ [a, b, c]
>   | a <- [1 .. n]
>   , b <- [a .. n]
>   , let c = n - a - b
>   , c >= b
>   , a ^ 2 + b ^ 2 == c ^ 2
>   ]

Trust the question and extract our single match with `head`.

> s009 = product $ head $ tripletsWithPerimeter 1000
