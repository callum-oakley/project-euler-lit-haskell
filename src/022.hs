import Data.Char (ord)
import Data.List (sort)
import Data.List.Index (imap)

-- A function to score each index–word pair is straight forward.

score :: Int -> String -> Int
score i name = (i + 1) * (sum $ map (\c -> ord c - 64) name)

-- Then the `imap` function from `Data.List.Index` makes short work of
-- calculating the total.

s022 = do
  raw <- readFile "data/022"
  return $ sum $ imap score $ sort $ read $ "[" ++ raw ++ "]"
