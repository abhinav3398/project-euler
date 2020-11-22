using Test

include("solution.jl")

@testset "example" begin
	@test distinct_powers(5, 5) == 15
end