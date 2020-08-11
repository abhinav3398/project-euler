using Test

include("solution.jl")

@testset "example" begin
	@test largest_product_in_a_series(4) == 5832
end

largest_product_in_a_series(13)