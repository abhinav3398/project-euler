using Test

include("solution.jl")

@testset "example" begin
	@test summation_O_primes_below(10) == 17
end

summation_O_primes_below(2_000_000)