using Test

include("solution.jl")

@testset "example" begin
	@test even_fib(2) == 2
	@test even_fib(10) == 10
	@test even_fib(45) == 44
	@test even_fib(44+144) == 44 + 144
end

even_fib(4_000_000)