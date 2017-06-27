
class SumOfMultiples
  def initialize(*set_of_numbers)
    @set_of_numbers = set_of_numbers
  end

  def self.to(end_of_range, set_of_numbers = [3, 5])
    start = set_of_numbers.sort.first
    return 0 if end_of_range < start

    (start...end_of_range).select do |multiple|
      set_of_numbers.any? do |number|
        multiple % number == 0
      end
    end.inject(:+)
  end

  def to(end_of_range)
    self.class.to(end_of_range, @set_of_numbers)
  end
end
