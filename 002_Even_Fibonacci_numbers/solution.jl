function even_fib(n::Int)
    a, b = 0, 2
    S = a
    while b <= n
        a, b, S = b, 4b + a, S + b
    end
    S
end