-- We can make our life a lot easier by using `Data.Time` rather than
-- re-inventing the wheel.

import Data.Time.Calendar (fromGregorian)
import Data.Time.Calendar.WeekDate (toWeekDate)

-- Then we can just count Sundays over a range of days.

s019 = length $ filter ((\(_, _, d) -> d == 7) . toWeekDate)
  [fromGregorian y m 1 | y <- [1901 .. 2000], m <- [1 .. 12]]
