class Trinary
  def initialize(str)
    @num_str = str
  end

  def to_decimal
    return 0 unless valid?
    digits = @num_str.chars.reverse.map(&:to_i)
    decimal_pieces = digits.each_with_index.map do |digit, index|
      digit * (3**index)
    end

    decimal_pieces.reduce(:+)
  end

  private

  def valid?
    @num_str.chars.each do |char|
      return false unless ["0", "1", "2"].include? char
    end
  end
end
