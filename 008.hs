import Data.Char (digitToInt)
import Data.List (tails)

slicesOf :: Int -> [Int] -> [Int]
slicesOf n = map product . foldr (zipWith (:)) (repeat []) . take n . tails

s008 =
  maximum . slicesOf 13 . map digitToInt . concat . lines <$>
  readFile "data-008"
