using Test

include("solution.jl")

@testset "example" begin
	@test number_letter_counts(5) == 19
end

number_letter_counts(1000)