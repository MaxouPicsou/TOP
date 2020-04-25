def bubble_sort(array_to_sort)
    array_to_sort.length.times do 
        for i in (0..array_to_sort.length - 2)
            if array_to_sort[i] > array_to_sort[i + 1]
                mem = array_to_sort[i]
                array_to_sort[i] = array_to_sort[i+1]
                array_to_sort[i+1] = mem
            end
        end
    end
    return array_to_sort
end

print bubble_sort([4,3,78,2,0,2])