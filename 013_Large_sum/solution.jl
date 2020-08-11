function get_data()
    data = []
    open("013_Large_sum/data.txt") do f
        for line in readlines(f)
            push!(data, line)
        end
    end
    data
end

function old_school()
    X = get_data()

    sum_in_digits = Int[]
    rows = length(X)
    cols = length(X[1])
    ith_dig_in_sum = carry = 0
    for c ∈ cols:-1:1
        sum_O_ith_digs = carry
        for r ∈ 1:rows
            sum_O_ith_digs += parse(Int, X[r][c])
        end
        carry, ith_dig_in_sum = divrem(sum_O_ith_digs, 10)
        pushfirst!(sum_in_digits, ith_dig_in_sum)
    end
    pushfirst!(sum_in_digits, carry)
    join(string.(sum_in_digits))
end