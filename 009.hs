tripletsWithPerimeter :: Integer -> [[Integer]]
tripletsWithPerimeter n =
  [ [a, b, c]
  | a <- [1 .. n]
  , b <- [a .. n]
  , let c = n - a - b
  , c >= b
  , a ^ 2 + b ^ 2 == c ^ 2
  ]

s009 = product $ head $ tripletsWithPerimeter 1000
