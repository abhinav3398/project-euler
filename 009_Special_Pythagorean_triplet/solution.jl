"""
```
pythagorean_triplets(n::Integer)
```
Given an input integer `n`, finds all Pythagorean triplets for which `a` + `b` + `c` = `n`.

A Pythagorean triplet is a set of three natural numbers, {a, b, c}, for which,
`a² + b² = c²`
and such that,
`0 < a < b < c`

# Example
given `n = 1000`, there is exactly one Pythagorean triplet for which `a + b + c == n` and satisfies above conditions:

```
julia> pythagorean_triplets(1000)
1-element Array{Tuple{Int64,Int64,Int64},1}:
 (200, 375, 425)
```
"""
function pythagorean_triplets(n::Integer)
    triplets = NTuple{3, Int}[]
    # c = n^2
    #* Lower bound because the smallest triple is 3, 4, 5.
    #* Upper bound implied by x < y < z && x + y + z == n
    # for x ∈ 3:cld(n, 3) - 1
    for x ∈ 3:floor(Int64, (1 - 1/√2)n)
        #* then, by solving:
        #*     z² = x² + y²,
        #*     x + y + z = n
        #*     for y,
        # y = (c - n * x) / (n - x)
        y = (n^2 - 2n * x) / (2 * (n - x))
        x < y && isinteger(y) && # boundary condition
            push!(triplets, (x, y, n - (x + y)))
    end
    
    sort!(triplets)
end

function special_pythagorean_triplets(n)
    triplets = pythagorean_triplets(n)
    reduce.(*, triplets)
end