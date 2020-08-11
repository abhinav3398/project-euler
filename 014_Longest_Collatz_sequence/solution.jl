# using BenchmarkTools, LinearAlgebra, SparseArrays, Random
# using LightGraphs, GraphPlot

struct Collatz
   start::Int
end
# literally generates Collatz sequence as any other/regular sequence(to B precise: range with unpredictable bound)
function Base.iterate(iter::Collatz, state=iter.start)
   element = state

   element == 1 && return nothing

   return (element, isodd(element) ? (3element + 1) : (element ÷ 2))
end

function max_collatz2(N::T) where T <: Integer
    max_num = 0
    for i ∈ 1:N, element ∈ Collatz(i)
        max_num = max(element, max_num)
    end
    max_num
end

#= 
function collatz_graph(N::Int)
    collatz_adj = [Edge(2, 1)]
    collatz_nums = [1,2]
    max_num = 0
    for n ∈ 2:N
        pre_collatz = -1
        push!(collatz_nums, n)
        for current_collatz ∈ Collatz(n)
            if pre_collatz > 0
                e = Edge(pre_collatz, current_collatz)
                e ∈ collatz_adj && break
                push!(collatz_adj, e)
                push!(collatz_nums, current_collatz)
            end
            pre_collatz = current_collatz
            max_num = max(current_collatz, max_num)
        end
    end
    g = SimpleDiGraph(collatz_adj)
    colletz_nodelabels = rem_vertices!(g,[i for i ∈ 1:max_num if i ∉ collatz_nums])
    g, colletz_nodelabels
end

# TODO
function collatz_layout(g, collatz_nums)
    n = length(collatz_nums)

    xs = [0.0] #; map(k -> cos(2pi * k / n), 1:n) ]
    ys = [0.0] #; map(k -> sin(2pi * k / n), 1:n) ]
    🔃 = 🔄 = 0.0
    Δθ = 5/180
    @show collatz_nums
    for (i, k) ∈ enumerate(collatz_nums[2:end])
        if isodd(k)
            push!(xs, last(xs) + cos(pi * 🔃))
            push!(ys, last(ys) + sin(pi * 🔃))
            🔃 += Δθ
        else
            push!(xs, last(xs) + cos(pi * 🔄))
            push!(ys, last(ys) + sin(pi * 🔄))
            🔄 -= Δθ
        end
    end

    return function(g)
        xs, ys
    end
end 
=#

collatz_dict = Dict{BigInt, BigInt}()
function max_collatz(N::T; collatz_dict=collatz_dict) where T <: Integer
    max_len, max_num = 0, 2
    for n ∈ 2:N
        len = 0
        for element ∈ Collatz(n)
            if haskey(collatz_dict, element)
                len += collatz_dict[element]
                break
            else
                len += 1
            end
        end
        collatz_dict[n] = len
        if len > max_len
            max_len, max_num = len, n
        end
    end
    max_len, max_num
end