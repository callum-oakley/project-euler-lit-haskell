-- This one is trivial.

s013 =
  take 10 . show . sum . map read . lines <$>
  readFile "data/013"
