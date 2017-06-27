class Octal
  def initialize(num_str)
    @num_str = num_str
  end

  def to_decimal
    return 0 unless valid?
    digit_ary = @num_str.chars.reverse.map(&:to_i)
    decimal_pieces = digit_ary.each_with_index.map do |digit, index|
      digit * (8 ** index)
    end

    decimal_pieces.reduce(:+)
  end

  def valid?
    @num_str.chars.each do |num|
      return false unless ["0", "1", "2", "3", "4", "5", "6", "7"].include? num
    end
  end
end
