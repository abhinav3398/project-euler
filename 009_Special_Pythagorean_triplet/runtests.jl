using Test

include("solution.jl")

@testset "example" begin
	@test pythagorean_triplets(12) == [(3,4,5)]
	@test special_pythagorean_triplets(12) == [60]
end

special_pythagorean_triplets(1000) |> first