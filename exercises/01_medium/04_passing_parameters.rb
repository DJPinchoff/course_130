def a_method(array)
  yield(array)
end

array = ['raven', 'finch', 'hawk', 'eagle']
a_method(array) do |_, _, *raptors|
  p raptors
end
