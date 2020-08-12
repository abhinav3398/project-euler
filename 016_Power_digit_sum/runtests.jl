using Test

include("solution.jl")

@testset "example" begin
	@test power_digit_sum.(4:10) == [7, 5, 10, 11, 13, 8, 7]
end

power_digit_sum(1000)