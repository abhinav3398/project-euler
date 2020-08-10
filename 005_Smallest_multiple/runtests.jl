using Test

include("solution.jl")

@testset "example" begin
	@test smallest_multiple(10) == 2520
end

smallest_multiple(20)