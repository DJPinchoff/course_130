factorials = Enumerator.new do | yielder |
  acc = 1
  num = 0
  loop do
    acc = num.zero? ? 1 : acc * num
    yielder << acc
    num += 1
  end
end

7.times { puts factorials.next }

factorials.rewind

factorials.each_with_index do |num, index|
  puts num
  break if index == 6
end
