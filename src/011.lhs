We're going to want to store our grid as a two dimensional
[Array](https://hackage.haskell.org/package/array-0.5.2.0/docs/Data-Array.html).

> import Data.Array (Array, listArray, (!))
>
> type Grid = Array (Int, Int) Integer

Given some `Grid` we can get all of the products of four horizonal elements as
follows (hard coding indices for simplicity).

> horizontalProducts :: Grid -> [Integer]
> horizontalProducts grid =
>   [ product [ grid ! (row, column + i) | i <- [0 .. 3] ]
>   | row <- [0 .. 19], column <- [0 .. 16]
>   ]

Similarly for the vertical and both diagonals.

> verticalProducts :: Grid -> [Integer]
> verticalProducts grid =
>   [ product [ grid ! (row + i, column) | i <- [0 .. 3] ]
>   | row <- [0 .. 16], column <- [0 .. 19]
>   ]
>
> diagonalProducts :: Grid -> [Integer]
> diagonalProducts grid =
>   [ product [ grid ! (row + i, column + i) | i <- [0 .. 3] ]
>   | row <- [0 .. 16], column <- [0 .. 16]
>   ]
>
> diagonalProducts' :: Grid -> [Integer]
> diagonalProducts' grid =
>   [ product [ grid ! (row + i, column - i) | i <- [0 .. 3] ]
>   | row <- [0 .. 16], column <- [3 .. 19]
>   ]

Finally let's write a function for building a `Grid` from the raw input string,
and plumb everything together to find the maximum product.

> mkGrid :: String -> Grid
> mkGrid s = listArray ((0, 0), (19, 19))
>   [read word | line <- lines s , word <- words line]
>
> s011 = do
>   grid <- mkGrid <$> readFile "data/011"
>   return $ maximum $ concatMap ($ grid)
>     [ horizontalProducts
>     , verticalProducts
>     , diagonalProducts
>     , diagonalProducts'
>     ]
