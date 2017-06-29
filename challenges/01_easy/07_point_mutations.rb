class DNA
  def initialize(string)
    @string = string
  end

  def hamming_distance(string)
    max_index = [@string.length, string.length].min
    count = 0
    max_index.times do |index|
      count += 1 if @string[index] != string[index]
    end

    count
  end
end
