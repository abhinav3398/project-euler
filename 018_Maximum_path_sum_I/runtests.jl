using Test

include("solution.jl")

@testset "example" begin
	@test maximum_path_sum!([3 0 0 0
							7 4 0 0
							2 4 6 0
							8 5 9 3]) == 23
end

get_triag("018_Maximum_path_sum_I/p018_triangle.txt") |> maximum_path_sum!