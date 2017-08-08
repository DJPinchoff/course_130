class PhoneNumber
  ERROR = '0000000000'

  def initialize(raw_number)
    @raw_number = raw_number
  end

  def process(num)
    return num[1..-1] if num.length == 11 && num[0] == '1'
    num.length == 10 ? num : ERROR
  end

  def number
    return ERROR if @raw_number.match?(/[a-zA-Z]/)

    clean_number = ''
    @raw_number.chars.each do |char|
      clean_number << char if char.match?(/\d/)
    end

    process clean_number
  end

  def area_code
    number[0..2]
  end

  def exchange_code
    number[3..5]
  end

  def line_number
    number[6..9]
  end

  def to_s
    "(#{area_code}) #{exchange_code}-#{line_number}"
  end
end
