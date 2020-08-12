using Test

include("solution.jl")

@testset "example" begin
	@test factorial_digit_sum(10) == 27
end

factorial_digit_sum(100)