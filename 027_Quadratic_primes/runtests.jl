using Test

include("solution.jl")

@testset "example" begin
	@test get_quadratic_function(1, 41) |> total_consecutive_primes_generated_by_quadratic_function == 40
	@test get_quadratic_function(-79, 1601) |> total_consecutive_primes_generated_by_quadratic_function == 80
end