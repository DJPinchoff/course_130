items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Let's start gathering food."
end

gather(items) { |array| puts "#{items.join(', ')}" }
gather(items) { |stuff| puts "We've gathered some stuff: #{stuff[0]} and #{stuff[1]}"}
