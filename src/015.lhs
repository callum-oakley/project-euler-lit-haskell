We can map routes bijectively to strings of length 40 consisting of exactly 20
Rs ("Right") and exactly 20 Ds ("Down"). Elementary combinatorics tells us
there are "40 [choose](https://en.wikipedia.org/wiki/Binomial_coefficient) 20"
of these.

> choose :: Integer -> Integer -> Integer
> choose n k = div (factorial n) (factorial k * factorial (n - k))
>   where
>     factorial m = product [1 .. m]
>
> s015 = choose 40 20
