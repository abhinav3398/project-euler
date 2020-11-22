function sum_O_number_O_spiral_diagonals(n::Integer)
    n == 1 && return 1
    n < 1 && return 0

    i = 1
    sum_O_diagonals = i

    for step ∈ 2:2:n, _ ∈ 1:4
            i += step
            sum_O_diagonals += i
    end
    
    sum_O_diagonals
end

sum_O_number_O_spiral_diagonals(1001)