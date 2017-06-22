fibs :: [Integer]
fibs = 0 : scanl (+) 1 fibs

s002 = sum $ filter even $ takeWhile (<= 4 * 10 ^ 6) fibs
