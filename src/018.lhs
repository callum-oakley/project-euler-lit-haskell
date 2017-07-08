We'll represent the triangle as a nested list. Actually calculating the maximum
total from top to bottom can be done in one pass, folding from bottom to top
and accumulating the maximum totals.

> maxTotal :: [[Integer]] -> Integer
> maxTotal =
>   head . foldr1 (\row acc -> zipWith3 newTotal row acc (tail acc))
>   where
>     newTotal new left right = new + max left right

Building the triangle and applying `maxTotal`.

> s018 =
>   maxTotal . map (map read) . map words . lines <$>
>   readFile "data/018"
