using Test

include("solution.jl")

@testset "example" begin
	@testset "sum of divisors" begin
		@test divisor_sum(28) == 28
		@test divisor_sum(12) == 16
		@test divisor_sum(16) == 15
		@test divisor_sum(36) == 55
	end

	@test isperfect(28)
	@test isabundant(12)

	@testset "main" begin
		main_naieve(100) == 2766
		main(100) == 2766
	end
end

main(28123)