using Primes: nextprime

function summation_O_primes_below(n)
    s = BigInt(0)
    _prime = nextprime(1)
    while _prime < n
        s += _prime
        _prime = nextprime(_prime+1)
    end
    s
end