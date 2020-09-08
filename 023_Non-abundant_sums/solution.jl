using Primes: factor

function divisor_sum(N)
    s, mid_point = 0, isqrt(N)

    for a ∈ 2:mid_point
        if N % a == 0
            b = N ÷ a
            s += a + (a != b ? b : 0)
        end
    end

    s + 1
end

isperfect(N) = divisor_sum(N) == N
isdeficient(N) = divisor_sum(N) < N
isabundant(N) = divisor_sum(N) > N

abundant_nums(N) = [i for i in 12:N if isabundant(i)]

function main_naieve(N=28123)
    # Find all abundant numbers
    _abundant_nums = abundant_nums(N) 
    # Make all the sums of two abundant numbers
    L = length(_abundant_nums)
    sums_O_2_abundant_nums = [_abundant_nums[i]+_abundant_nums[j] for i ∈ 1:L for j ∈ i:L]
    # Sum the numbers which are not sums of two abundant numbers
    sum(i for i ∈ 1:N if i ∉ sums_O_2_abundant_nums)
end

function sum_of_div(N)
    somDiv = ones(Int, N)
    for i ∈ 2:isqrt(N)
      somDiv[i^2] += i
      for k ∈ i+1:(N ÷ i)
          somDiv[Int(k*i)] += k+i
      end
    end
    somDiv
end

function main(limit = 28123)
    _sum_of_div = sum_of_div(limit)
    abundant, res = Set{Int}(), 0
    for n ∈ 1:limit
      _sum_of_div[n] > n && push!(abundant, n)
      !any(a -> n-a ∈ abundant, abundant) && (res += n)
    end
    res
end