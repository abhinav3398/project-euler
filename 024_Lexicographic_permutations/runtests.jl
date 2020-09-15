using Test

include("solution.jl")

@testset "example" begin
	@test permutations([0, 1, 2]) |> collect == [[0,1, 2], [0,2, 1], [1,0, 2], [1,2,0], [2,0,1], [2,1,0]]
end

main()