using Test

include("solution.jl")

@testset "example" begin
	@test main(2) == 7
	@test main(3) == 12
end