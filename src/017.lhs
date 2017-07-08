This is pretty dull, but it works.

> say :: Integer -> String
> say n
>   | n == 1 = "one"
>   | n == 2 = "two"
>   | n == 3 = "three"
>   | n == 4 = "four"
>   | n == 5 = "five"
>   | n == 6 = "six"
>   | n == 7 = "seven"
>   | n == 8 = "eight"
>   | n == 9 = "nine"
>   | n == 10 = "ten"
>   | n == 11 = "eleven"
>   | n == 12 = "twelve"
>   | n == 13 = "thirteen"
>   | n == 14 = "fourteen"
>   | n == 15 = "fifteen"
>   | n == 16 = "sixteen"
>   | n == 17 = "seventeen"
>   | n == 18 = "eighteen"
>   | n == 19 = "nineteen"
>   | n == 20 = "twenty"
>   | n == 30 = "thirty"
>   | n == 40 = "forty"
>   | n == 50 = "fifty"
>   | n == 60 = "sixty"
>   | n == 70 = "seventy"
>   | n == 80 = "eighty"
>   | n == 90 = "ninety"
>   | n < 100 = say (div n 10 * 10) ++ say (mod n 10)
>   | n == 1000 = "onethousand"
>   | mod n 100 == 0 = say (div n 100) ++ "hundred"
>   | otherwise = say (div n 100 * 100) ++ "and" ++ say (mod n 100)
>
> s017 = sum $ map (length . say) $ [1 .. 1000]
