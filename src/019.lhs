We can make our life a lot easier by using `Data.Time` rather than
re-inventing the wheel.

> import Data.Time.Calendar (fromGregorian, addGregorianMonthsClip)
> import Data.Time.Format (defaultTimeLocale, formatTime)

Then we can just count Sundays over a range of days.

> s019 = length $ filter (\d -> day d == "Sun") $ days
>   where
>     nextMonth = addGregorianMonthsClip 1
>     from = fromGregorian 1901 1 1
>     to = fromGregorian 2000 12 31
>     days = takeWhile (< to) $ iterate nextMonth $ from
>     day d = formatTime defaultTimeLocale "%a" d
