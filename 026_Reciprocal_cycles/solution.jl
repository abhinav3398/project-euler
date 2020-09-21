function reciprocal_len(n)
    # computes length of reciprocal sysle 1/n
    # i.e. 6 or 1/7 = 0.142857

    # 1/7
    # 10/7 => 1 times => .1 rest 3
    # 30/7 => 4 times => .14 rest 2
    start = 10
    rest = 1
    used = Dict{Int, Int}()
    len = 0

    while rest != 0
        if haskey(used, start)
            return len - used[start]            
        end
        used[start] = len
        dig = div(start, n)
        rest = start % n
        start = rest * 10
        len += 1
    end

    return 0
end