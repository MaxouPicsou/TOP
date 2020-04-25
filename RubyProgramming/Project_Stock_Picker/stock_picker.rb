def stock_picker(prices)
    result = {}
    maxi = prices[1] - prices[0]
    for i in (0..prices.size - 1)
        for j in (i+1..prices.size - 1)
            if prices[j] - prices[i] > maxi
                maxi = prices[j] - prices[i]
                result = [i, j]
            end
        end
    end
    print result
    puts
end

stock_picker([17,3,6,9,15,8,6,1,10])