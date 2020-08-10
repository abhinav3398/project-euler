using Test

include("solution.jl")

@testset "example" begin
	@test sum_square_diff(10) == 2640
end

sum_square_diff(20)