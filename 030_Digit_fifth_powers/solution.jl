is_nᵗʰpower(d, n; buffer) = sum(x->x^n, digits!(buffer, d)) == d
naieve_sum_O_nᵗʰpower(n; max_limit=n+2, buffer=zeros(Int, max_limit)) = sum(i for i ∈ 2:(10^max_limit) if is_nᵗʰpower(i, n, buffer=buffer))
buffer = zeros(Int, 5+2)
@benchmark naieve_sum_O_nᵗʰpower(5, buffer=buffer)

# https://projecteuler.net/thread=30;page=7#367335 by dynortice @ Wed, 16 Sep 2020, 08:03
using Combinatorics

function compute(n::Int64)::Int64
    max_len = 2
    result = 0
    powers = [i ^ n for i in 0:9]
    @views while length(string(max_len * 9 ^ n)) >= max_len
        for digits_ in Combinatorics.with_replacement_combinations(0:9, max_len)
            candidate = sum(powers[i+1] for i in digits_)
            if sort!(digits(candidate)) == sort!(digits_)
                result += candidate
            end
        end
        max_len += 1
    end
    return result
end

@benchmark compute(5)
@btime compute(6)
@btime compute(7)
@btime compute(8)
@btime compute(9)
@btime compute(10)
@btime compute(11)