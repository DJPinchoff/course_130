class Phrase
  def initialize(string)
    @phrase = string
    @words = @phrase.scan(/\w+'?\w+|\d+/)
  end

  def word_count
    result = Hash.new(0)
    @words.each do |word|
      result[word.downcase] += 1
    end

    result
  end
end
