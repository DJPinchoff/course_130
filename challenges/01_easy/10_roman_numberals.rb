class Numeric
  ROMAN_NUMERAL_CONVERSION = { 'M' => 1000, 'CM' => 900,
                               'D' => 500, 'CD' => 400,
                               'C' => 100, 'XC' => 90,
                               'L' => 50, 'XL' => 40,
                               'X' => 10, 'IX' => 9,
                               'V' => 5, 'IV' => 4,
                               'I' => 1 }

  def to_roman
    result_string = ""
    num = self
    ROMAN_NUMERAL_CONVERSION.each do |roman_letter, divisor|
      times, num = num.divmod(divisor)
      result_string += roman_letter * times
    end

    result_string
  end
end
