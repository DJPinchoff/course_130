def compute(arg)
  block_given? ? yield(arg) : "Does not compute."
end

p compute(5) { |arg| (5 + 3) * arg } == 40
p compute(3) { |arg| 'ab' * arg } == 'ababab'
p compute(0) == 'Does not compute.'
p compute("String") { |arg| puts arg } == nil
