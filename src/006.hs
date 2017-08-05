-- This is just a direct translation of the statement of the question to valid
-- Haskell.

s006 = sum [1 .. 100] ^ 2 - sum [n ^ 2 | n <- [1 .. 100]]
