using Test

include("solution.jl")

@testset "example" begin
	@test triangle_number_over_N_divisors(5) == 28
end

triangle_number_over_N_divisors(500)