This is a one liner with some combinatorics, but let's solve it in a slightly
more interesting way. Imagine labelling each point in our lattice with the
number of routes that end at that point. (Indexing from `(0, 0)` in the top
left corner.)

- Every point at the top or left edge of the lattice has precisely one route to
  it (consisting of just left or just down repeatedly).

- For every other point, `(x, y)`, each route that ends at `(x, y)` must pass
  through either the point immediately above or immediately to the right, so
  the number of routes to `(x, y)` is the sum of the number of routes to `(x -
  1, y)` and the number of routes to `(x, y - 1)`. The implementation then is a
  straightforward recursion, which we memoize for efficiency.

> import Data.Array (Array, listArray, range, (!))
>
> lattice
>   :: ((Integer, Integer), (Integer, Integer))
>   -> Array (Integer, Integer) Integer
> lattice ix = memo
>   where
>     memo = listArray ix [lattice' i | i <- range ix]
>     lattice' (x, y)
>       | x == 0 || y == 0 = 1
>       | otherwise = memo ! (x - 1, y) + memo ! (x, y - 1)
>
> s015 = lattice ((0, 0), (20, 20)) ! (20, 20)

There's an outrageously neat solution on [the Haskell wiki](https://wiki.haskell.org/Euler_problems/11_to_20) that works in a very similar way, but makes a couple more logical jumps so is slightly harder to unpack. I'll leave it here becuse it's awesome.

> s015' = iterate (scanl1 (+)) (repeat 1) !! 20 !! 20
