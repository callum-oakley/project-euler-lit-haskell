-- We're going to want to store our grid as a two dimensional
-- [Array](https://hackage.haskell.org/package/array-0.5.2.0/docs/Data-Array.html).

import Data.Array (Array, bounds, listArray, (!))
import Data.Ix (inRange, range)

type Grid = Array (Int, Int) Integer

-- Given some grid we can get all of the products of four adjacent elements as
-- follows.

adjacentProducts :: Grid -> [Integer]
adjacentProducts grid =
  [ product $ map (grid !) is
  | (x, y) <- range $ bounds grid
  , (dx, dy) <- [(1, 0), (0, 1), (1, 1), (1, -1)]
  , let is = [(x + k * dx, y + k * dy) | k <- [0 .. 3]]
  , all (inRange (bounds grid)) is
  ]

-- There's quite a lot going on here so let's walk through it. We're taking
-- each index `i` in the grid, and then for each possible direction, we're
-- calculating the four adjacent indices gotten by starting at `i` and moving
-- in that direction – zero to three times. Finally we're just checking that
-- each of the indices is within our grid and extracting the actual product of
-- the elements at these positions.
--
-- All that remains is to write a function for building a `Grid` from the raw
-- input string, and plumb everything together to find the maximum product.

mkGrid :: String -> Grid
mkGrid = listArray ((0, 0), (19, 19)) . map read . words

s011 = maximum . adjacentProducts . mkGrid <$> readFile "data/011"
