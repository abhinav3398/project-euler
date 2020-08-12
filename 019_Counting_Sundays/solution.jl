using Dates

"""
```
counting_sundays_naieve(DAYOFWEEK::Int [, _start = Date(1901, 1, 1), _end = Date(2000, 12, 31)]) -> Int64
```

How many `DAYOFWEEK` fell on the first of each month during the `_start::Date` to `_end::Date` (default to: 1 Jan 1901 to 31 Dec 2000)?

# Examples
```
julia> counting_days_on_1st_month_naieve(7)
171
```
"""
function counting_days_on_1st_month_naieve(DAYOFWEEK::Int, _start = Date(1901, 1, 1), _end = Date(2000, 12, 31))
    days = 0
    DAYOFWEEK = dayofweek(DAYOFWEEK)
    for d ∈ _start:Month(1):_end
        if dayofweek(d) == DAYOFWEEK
            days += 1
        end
    end
    days
end

"""
```
counting_days_on_1st_month_efficient(DAYOFWEEK::Int [, _start = Date(1901, 1, 1), _end = Date(2000, 12, 31)]) -> Int64
```

How many `DAYOFWEEK` fell on the first of each month during the `_start::Date` to `_end::Date` (default to: 1 Jan 1901 to 31 Dec 2000)?

# Examples
```
julia> counting_days_on_1st_month_naieve(14)
171
```
"""
function counting_days_on_1st_month_efficient(DAYOFWEEK::Int, _start = Date(1901, 1, 1), _end = Date(2000, 12, 31))
    years = Year(_end) - Year(_start) + Year(1)
    total_months = years.value*12
    daysinweek = 7
    (total_months ÷ daysinweek) + (dayofweek(_start) == DAYOFWEEK)
end