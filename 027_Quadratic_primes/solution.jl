using Primes: isprime

get_quadratic_function(a, b) = n -> (n^2 + a*n + b)

function total_consecutive_primes_generated_by_quadratic_function(quadratic_function)
    n = 0
    while true
        isprime(quadratic_function(n)) ? (n += 1) : break
    end
    n
end

function quadratic_primes()
    max_a = max_b = max_primes = 0

    for a ∈ -999:999, b ∈ -1000:1000
        cur_primes = get_quadratic_function(a, b) |> total_consecutive_primes_generated_by_quadratic_function
        if cur_primes > max_primes
            max_primes = cur_primes
            max_a, max_b = a, b
        end
    end

    max_a * max_b
end

quadratic_primes()