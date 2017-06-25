Pick your favourite fibs definition from [the Haskell wiki](https://wiki.haskell.org/The_Fibonacci_sequence).

> fibs :: [Integer]
> fibs = 0 : scanl (+) 1 fibs

The self reference works here because `scanl` is only ever consuming values of
`fibs` that we have already calculated. Once we have all the fibbonacci numbers
the solution is trivial.

> s002 = sum $ filter even $ takeWhile (<= 4 * 10 ^ 6) fibs
