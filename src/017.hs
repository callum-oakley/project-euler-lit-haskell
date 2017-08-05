-- This is pretty dull, but it works.

say :: Integer -> String
say n
  | n == 1 = "one"
  | n == 2 = "two"
  | n == 3 = "three"
  | n == 4 = "four"
  | n == 5 = "five"
  | n == 6 = "six"
  | n == 7 = "seven"
  | n == 8 = "eight"
  | n == 9 = "nine"
  | n == 10 = "ten"
  | n == 11 = "eleven"
  | n == 12 = "twelve"
  | n == 13 = "thirteen"
  | n == 15 = "fifteen"
  | n == 18 = "eighteen"
  | n < 20 = say (mod n 10) ++ "teen"
  | n == 20 = "twenty"
  | n == 30 = "thirty"
  | n == 40 = "forty"
  | n == 50 = "fifty"
  | n == 80 = "eighty"
  | n < 100 && mod n 10 == 0 = say (div n 10) ++ "ty"
  | n < 100 = say (div n 10 * 10) ++ say (mod n 10)
  | n < 1000 && mod n 100 == 0 = say (div n 100) ++ "hundred"
  | n < 1000 = say (div n 100 * 100) ++ "and" ++ say (mod n 100)
  | n == 1000 = "onethousand"

s017 = sum $ map (length . say) [1 .. 1000]
