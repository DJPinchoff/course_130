class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num <= 0
    divisors = []
    (1...num).each do |divisor|
      divisors << divisor if num % divisor == 0
    end

    divisors_sum = divisors.inject(:+)
    if divisors_sum > num
      'abundant'
    elsif divisors_sum == num
      'perfect'
    else
      'deficient'
    end
  end
end
