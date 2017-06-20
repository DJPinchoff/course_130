def missing(sorted_array)
  (sorted_array[0]..sorted_array[-1]).reject { |num| sorted_array.include? num }
end

def also_missing(sorted_array)
  num = sorted_array[0]
  return_array = []
  while num < sorted_array[-1]
    return_array << num unless sorted_array.include? num
    num += 1
  end

  return_array
end


p also_missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p also_missing([1, 2, 3, 4]) == []
p also_missing([1, 5]) == [2, 3, 4]
p also_missing([6]) == []
