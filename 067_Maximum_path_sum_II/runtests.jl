using Test

include("solution.jl")

@testset "example" begin
	@test
end

get_triag("067_Maximum_path_sum_II/p067_triangle.txt") |> maximum_path_sum!