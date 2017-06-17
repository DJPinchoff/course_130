def reduce(array, start = 0)
  index = 0
  sum = start

  while index < array.size do
    sum = yield(sum, array[index])
    index += 1
  end

  sum
end

p reduce([1, 2, 3]) { |acc, num| acc + num }

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
