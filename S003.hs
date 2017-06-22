primeFactors :: Int -> [Int]
primeFactors 1 = []
primeFactors n = p : primeFactors (div n p)
  where
    p = head $ filter (\d -> mod n d == 0) [2 ..]

s003 = maximum $ primeFactors 600851475143
