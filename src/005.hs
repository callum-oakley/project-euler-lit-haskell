-- Rewording the question, we want the lowest common multiple of all the
-- numbers from 1 to 20, and since (mathematically speaking)
--
--     lcm x y z = lcm x (lcm y z)
--
-- we can just fold with `lcm`!

s005 = foldl lcm 1 [1 .. 20]
