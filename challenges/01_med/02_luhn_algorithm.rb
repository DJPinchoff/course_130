class Luhn
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def addends
    @number.digits.map.with_index do |num, index|
      if index.odd?
        num * 2 >= 10 ? num * 2 - 9 : num * 2
      else
        num
      end
    end.reverse
  end

  def checksum
    addends.inject(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(partial)
    temp = Luhn.new(partial * 10)
    return temp.number if temp.valid?
    temp.number + (10 - (temp.addends.inject(:+) % 10))
  end
end
