using Test

include("solution.jl")

@testset "example" begin
	first_names = get_names()
	
	@testset "extract & sort names" begin
		@test first_names isa AbstractArray
		@test first_names |> eltype <: AbstractString
		@test findfirst(x -> x == "COLIN", first_names) == 938
	end

	@testset "scores" begin
		@test word_score("COLIN") == 53
	end
end

names_score()