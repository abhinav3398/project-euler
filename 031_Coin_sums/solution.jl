#Project Euler Problem 31

function ways(target, coins)
    ways = pushfirst!(repeat([0], target), 1)
    
    for coin in coins, i in coin:target
        ways[i+1] += ways[i-coin+1]
    end
    
    ways[end]
end

target = 200
coins = [1, 2, 5, 10, 20, 50, 100, 200]
ways(target, coins)