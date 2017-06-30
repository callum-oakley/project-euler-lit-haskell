WIP

> import Data.Array (Array, array, listArray)

> grid :: IO (Array (Int, Int) Integer)
> grid = parse <$> readFile "data/011"
>   where
>     indices = ((0, 0), (19, 19))
>     parse = listArray indices . map read . concatMap words . lines

Make three arrays containing horizontal, vertical, and diagonal products, then
simply find the maximum element of the three.
