using Test

include("solution.jl")

@testset "example" begin
	@test sum_O_number_O_spiral_diagonals(5) == 101
	@test sum_O_number_O_spiral_diagonals(3) == 25
end