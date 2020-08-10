using BenchmarkTools

function ispalindrome(x)
    s = string(x)
    s == reverse(s)
end

"""
Compute the modular inverse of x modulo a power of 10.
Return nothing if the inverse does not exist.
This function uses Hensel lifting.
"""
function inverse(x, mod)
    idx = x % 10
    idx = (idx < 0) ? (10 + idx) : idx
    a = [nothing, 1, nothing, 7, nothing, nothing, nothing, 3, nothing, 9][idx + 1]
    (a === nothing) && return a
    while true
        ax = (a * x) % mod
        ax = (ax < 0) ? (mod + ax) : ax
        (ax == 1) && return a
        a = (a * (2 - ax)) % mod
        a = (a < 0) ? (mod + a) : a
    end
end

function largest_palindrome_made_from_product_of_two_Ndigit_numbers(n)
    @assert n > 2

    # Get a lower bound:
    # If n is even then we can construct a first palindrome.
    # If n is odd we simply guess
    k = n ÷ 2
    while true
        maxf = BigInt(10)^n - 1
        maxf11 = (maxf - 11) ÷ 22 * 22 + 11
        minf = BigInt(10)^n - BigInt(10)^(n - k) + 1
        if 2k == n
            best = maxf * minf
            factors = (maxf, minf)
            @assert ispalindrome(best)
        else
            best = minf * minf
            factors = nothing
        end
        # This palindrome starts with k 9's.
        # Hence the largest palindrom must also start with k 9's and
        # therefore end with k 9's.
        # Thus, if p = x * y is the solution then
        # x * y + 1 is divisible by mod.
        mod = 10^k
        mod == 1 && throw("mod is 1")
        # println("maxf::$maxf maxf11::$maxf11 minf::$minf best::$best factors::$factors mod::$mod")
        for x ∈ maxf11:-22:2
            (x * maxf < best) && break
            ry = inverse(x, mod)
            (ry === nothing) && continue
            maxy = maxf + 1 - ry
            for p ∈ (maxy * x):( -x * mod):(best - 1)
                if ispalindrome(p) && p > best
                    best = p
                    y = p ÷ x
                    factors = (x, y)
                end
            end
        end
        (factors !== nothing) && return best, factors
        k -= 1
    end
end