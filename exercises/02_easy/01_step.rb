def step(first, last, step)
  results = []
  current = first
  while current <= last
    results << current
    yield(current)
    current += step
  end

  results
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
