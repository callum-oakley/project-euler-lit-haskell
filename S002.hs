import Data.List

fibs :: [Int]
fibs = unfoldr (\(a, b) -> Just (a, (b, a + b))) (0, 1)

s002 = sum $ filter even $ takeWhile (<= 4 * 10 ^ 6) fibs
