using LinearAlgebra

const F = [BigInt(1) 1
           1 0];

fib(n) = F^n

function main(dgts)
    # initialize
    idx = 0
    x = fib(idx)
    while x[1] >= 0 && length(digits(x[1])) < dgts
        idx += 1
        mul!(x, x, F)
    end

    idx + 1
end