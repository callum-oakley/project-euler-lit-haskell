We'll make use of the
[`Data.List.Ordered`](https://hackage.haskell.org/package/data-ordlist-0.4.7.0/docs/Data-List-Ordered.html)
package; `minus` is an optimised version of `(\\)` from `Data.List` which
assumes its operands are ordered.

> import Data.List.Ordered (minus)

The definition of `primesTo` comes from [the Haskell
wiki](https://wiki.haskell.org/Prime_numbers). This one strikes a nice balance
between speed and readability (there are many more optimisations that could be
made, at the expense of the latter).

> primesTo :: Integer -> [Integer]
> primesTo n = eratos [2 .. n]
>   where
>     eratos [] = []
>     eratos (p:xs) = p : eratos (minus xs [p ^ 2, p ^ 2 + p .. n])

Note in particular that for each prime found we start eliminating multiples at
`p ^ 2`, since any smaller multiples must have another prime factor smaller
than `p`, and so will have already been removed.

A sufficient number of primes to generate (`2 ^ 17`) was found manually by trial
and error. A more robust solution would use some calculated bound.

> s007 = primesTo (2 ^ 17) !! 10000
