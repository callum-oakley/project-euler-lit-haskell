-- An easy one liner.

import Data.Char (digitToInt)

s020 = sum $ map digitToInt $ show $ product [1 .. 100]
