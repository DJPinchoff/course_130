require 'pry'

class Sieve
  def initialize(end_of_range)
    @numbers_with_prime_marker = (2..end_of_range).each_with_object(true).to_h
  end

  def primes
    @numbers_with_prime_marker.each_key do |num|
      next if @numbers_with_prime_marker[num] == false
      @numbers_with_prime_marker.each_key do |num2|
        next if num == num2
        @numbers_with_prime_marker[num2] = false if num2 % num == 0
      end
    end

    @numbers_with_prime_marker.select { |k, v| v == true }.keys.to_a
  end
end
