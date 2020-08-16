using Test

include("solution.jl")

@testset "example" begin
	@test SumOfProperDivisors(220) == 284
	@test get_amicable_number_if_possible(220) == 284
	@test isempty(amicable_numbers(100))
end

amicable_numbers(10000) |> sum == 31626