-- We calculate the prime factors of `n` recursively, finding the smallest
-- divisor at each stage. (The smallest divisor is necessarily prime, otherwise
-- it is `pq` for some prime `p` and some `q > 1`, and `p` is a smaller
-- divisor. Contradiction.)

primeFactors :: Integer -> [Integer]
primeFactors 1 = []
primeFactors n = p : primeFactors (div n p)
  where
    p = head $ filter (\d -> mod n d == 0) [2 ..]

-- Given this, the final solution is trivial.

s003 = maximum $ primeFactors 600851475143
