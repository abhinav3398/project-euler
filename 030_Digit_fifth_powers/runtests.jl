using Test

include("solution.jl")

@testset "example" begin
	@testset "is_nᵗʰpower" begin
		@test is_nᵗʰpower(9474, 4)
		@test is_nᵗʰpower(1634, 4)
		@test is_nᵗʰpower(8208, 4)
	end
	@test sum_O_nᵗʰpower(4) == 19316
end