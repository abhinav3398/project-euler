function get_data()
    rows = cols = 1
    raw_data = []
    open("data.txt") do f
        for line ∈ readlines(f)
            push!(raw_data, parse.(Int, split(line)))
            rows += 1
        end
    end
    cols = length(raw_data[1])
    rows -= 1
    data = zeros(Int, rows, cols)
    for i ∈ 1:rows
        data[i, :] .= raw_data[i]
    end
    data
end

function largest_product_in_a_grid()
    data = get_data()
    prods = Int[]
    rows, cols = size(data)
    # diagonal search
    for i ∈ 1:rows - 3, j ∈ 1:cols - 3 
        push!(prods, reduce(*, (data[i+x, j+x] for x ∈ 0:3)))
    end
    # cross-diagonal search
    for i ∈ 1:rows - 3, j ∈ 4:cols
        push!(prods, reduce(*, (data[i+x, j-x] for x ∈ 0:3)))
    end
    maximum(prods)
end