class Series
  def initialize(num_str)
    @num_ary = num_str.chars.map(&:to_i)
  end

  def slices(element_slice)
    raise ArgumentError, "Slice is too big!" if element_slice > @num_ary.size

    result = []
    @num_ary.each_cons(element_slice) { |slice| result << slice }
    result
  end
end
