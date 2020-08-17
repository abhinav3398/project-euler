using Primes: factor

SumOfProperDivisors(n) = SumOfDivisors(n) - n

# https://mathschallenge.net/index.php?section=faq&ref=number/sum_of_divisors
function SumOfDivisors(n::T) where T <: Integer
    s, p = 1, 2
    
    while p^2 <= n && n > 1
        if n % p == 0
            j = p^2
            n ÷= p
            while n % p == 0
                 j *= p
                 n ÷= p
            end
            s *= j-1
            s ÷= p-1
        end
        p == 2 ? (p = 3) : (p += 2)
    end

    n > 1 && (s *= n+1)
    s
end

function SumOfDivisors_naieve(n::T) where T <: Integer
    s = 1
    factors = factor(n)
    for factor_pair ∈ factors
        p, a = factor_pair.first, factor_pair.second
        s *= (p^(a+1) - 1) ÷ (p - 1)
    end
    s
end

@inline function get_amicable_number_if_possible(a)
     b = SumOfProperDivisors(a)
     return (SumOfProperDivisors(b) == a && a != b) ? b : -1
end

function amicable_numbers(n::T) where T <: Integer
    amicable_nums = T[]
    for a ∈ 1:n
        b = a ∉ amicable_nums ? get_amicable_number_if_possible(a) : 0
        if b > 0 && b != n
            push!(amicable_nums, a)
            push!(amicable_nums, b)
        end
    end
    amicable_nums
end