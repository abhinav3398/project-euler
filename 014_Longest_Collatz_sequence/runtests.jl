using Test

include("solution.jl")

@testset "example" begin
	@test
end

@btime max_collatz(1_000_000)