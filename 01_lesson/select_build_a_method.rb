def select(array)
  index = 0
  new_array = []

  while index < array.size do
    new_array << array[index] if yield(array[index])
    index += 1
  end

  new_array
end

array = [1, 2, 3, 4, 5]

p array.select { |num| num.odd? }
p array.select { |num| puts num }
p array.select { |num| num + 1 }

puts

p select(array) { |num| num.odd? }
p select(array) { |num| puts num }
p select(array) { |num| num + 1 }
