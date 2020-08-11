using Primes, BenchmarkTools

function triangle_number_over_N_divisors(N)
    n = 3 # start with a prime
    Dn = 2 # number of divisors for any prime
    cnt = 0 # to insure the while loop is entered
    while cnt <= N
        n += 1
        n1 = n;
        iseven(n1) && (n1 ÷= 2)
        Dn1 = 1
        _prime = 2 # 1st prime number
        while _prime <= n1
            if _prime^2 > n1
                Dn1 *= 2
                break
            end
            # When the prime divisor would be greater than the residual n1,
            # that residual n1 is the last prime factor with an exponent=1
            # No necessity to identify it.
            exponent = 1
            while n1 % _prime == 0 
                exponent += 1
                n1 ÷= _prime
            end
            (exponent > 1) && (Dn1 *= exponent)
            (n1 == 1) && break
            _prime = nextprime(_prime + 1)
        end
        cnt = Dn * Dn1
        Dn = Dn1
    end
    n * (n - 1) ÷ 2 
end