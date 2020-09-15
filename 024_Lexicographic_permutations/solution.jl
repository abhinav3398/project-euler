using Combinatorics: permutations

function main()
    my_perm = permutations(0:9 |> collect)
    idx, limit = 1, 1_000_000
    for perm ∈ my_perm
        idx == limit ? (return perm |> join) : (idx += 1)
    end

    -1
end