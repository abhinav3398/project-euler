using Test

include("solution.jl")

@testset "example" begin
	@test factors(13195) == 29
end

factors(600851475143)