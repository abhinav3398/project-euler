using Test

includet("solution.jl")

@testset "example" begin
	@test reciprocal_len(7) == 6
	@test argmax(reciprocal_len.(1:10)) == 7
end

argmax(reciprocal_len.(1:1_000))