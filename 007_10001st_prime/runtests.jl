using Test

include("solution.jl")

@testset "example" begin
	@test nth_prime.(1:6) == [2, 3, 5, 7, 11, 13]
end

nth_prime(10001)