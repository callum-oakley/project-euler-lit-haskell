> import Data.Array (Array, assocs, listArray, (!))
> import Data.List (maximumBy)
> import Data.Ord (comparing)

It's tempting to write a function to calculate the Collatz length of a given
integer, and then to map that over every integer in the range to find our
maximum. However, if, for example, we already know the Collatz length of 20,
and we want to know the Collatz length of 40, it is unnecessary to recalculate
the Collatz length of 20. We can do a lot better by calculating every Collatz
length we care about together, and referencing values we already know.

To that end, the following function populates an array of the Collatz lengths
of all the numbers from 1 to its input.

> collatzLengths :: Integer -> Array Integer Integer
> collatzLengths n = memo
>   where
>     memo = listArray (1, n) [collatzLength m | m <- [1 .. n]]
>     collatzLength 1 = 1
>     collatzLength m
>       | k <= n = 1 + memo ! k
>       | k > n = 1 + collatzLength k
>       where
>         k = if even m then div m 2 else 3 * m + 1

`memo` is lazily populated, and defers to `collatzLength`, but once we have
calculated `collatzLength m` once, we can just look it up in `memo` on
subsequent calls.

> s014 =
>   fst $ maximumBy (comparing snd) $ assocs $
>   collatzLengths $ 10 ^ 6 - 1
