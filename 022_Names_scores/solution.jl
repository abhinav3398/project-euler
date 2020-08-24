using Pipe: @pipe

get_names() = open("022_Names_scores/p022_names.txt") do f
        @pipe readline(f) |> split(_, ",") |> replace.(_, "\"" => "") |> sort!
    end

word_score(words::AbstractString, idx = 1) = sum(x -> (x - 'A') + 1, words) * idx

function names_score()
    total = 0
    for (i, name) ∈ enumerate(get_names())
        total += word_score(name, i)
    end
    total
end