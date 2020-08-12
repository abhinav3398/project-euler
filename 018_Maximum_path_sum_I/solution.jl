function maximum_path_sum!(triag::Array{T}, r::T=1, c::T=1, rows::T=size(triag, 1), cols::T=size(triag, 2)) where T <: Integer
    r == rows-1 && return triag[r, c] + max(triag[r+1, c], triag[r+1, c+1])
    for r ∈ rows-1:-1:1
        triag[r, 1:cols-1] += max.(triag[r+1, 1:cols-1], triag[r+1, 2:cols])
        cols -= 1
    end
    return triag[1,1]
end

function get_triag(f_str::String)
    arr_str = []
    open(f_str) do f
        for line ∈ readlines(f)
            push!(arr_str, [split(line)...])
        end
    end

    rows = cols = length(arr_str)
    triag = zeros(Int, rows, cols)
    for r ∈ 1:rows
        for (c, num_str) ∈ enumerate(arr_str[r])
            triag[r, c] = parse(Int, num_str)
        end
    end

    triag
end