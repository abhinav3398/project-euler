using Test

include("solution.jl")

@testset "example" begin
	@test multiples_of_3n5(10) == 23
end

println(multiples_of_3n5(1000))