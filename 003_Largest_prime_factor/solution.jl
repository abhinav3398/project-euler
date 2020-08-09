function factors(n::Int)
    if n % 2 == 0
        lastFactor = 2
        n ÷= 2
        while n % 2 == 0
            n ÷= 2
        end
    else
        lastFactor = 1
    end
    factor = 3
    maxFactor = √n
    while (n > 1) && (factor <= maxFactor)
        if n % factor == 0
            n ÷= factor
            lastFactor = factor
            while n % factor == 0
                n ÷= factor
            end
            maxFactor = √n
        end
        factor += 2
    end
    return (n == 1) ? lastFactor : n
end