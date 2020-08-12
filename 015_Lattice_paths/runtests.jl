using Test

include("solution.jl")

@testset "example" begin
	@test count_routes(2) == 6
end

count_routes(20) |> Int