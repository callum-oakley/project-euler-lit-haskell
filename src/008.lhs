> import Data.Char (digitToInt)
> import Data.List (tails)

First we define a function that returns "slices" of length n from a list.
e.g. `slicesOf 3 [1 .. 5] = [[1, 2, 3], [2, 3, 4], [3, 4, 5]]`. By taking the
first n `tails` and then zipping them together.

> slicesOf :: Int -> [a] -> [[a]]
> slicesOf n = foldr (zipWith (:)) (repeat []) . take n . tails

The rest of the solution is plumbing to read the input, and to get the largest
product of the slices.

> s008 =
>   maximum . map product . slicesOf 13 . map digitToInt . concat . lines <$>
>   readFile "data/008"
