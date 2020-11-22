distinct_powers(a, b) = [big(i)^j for i ∈ 2:a for j ∈ 2:b] |> unique! |> length

distinct_powers(100, 100)