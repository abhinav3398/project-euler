function count_routes(n, m=n)
    num = factorial(m+BigInt(n))
    den = factorial(BigInt(m))*factorial(BigInt(n))
    num/den
end