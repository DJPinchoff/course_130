class Anagram
  def initialize(word)
    @original_word = word
  end

  def sort(word)
    word.downcase.chars.sort
  end

  def match(words)
    words.select do |word|
      next if word.downcase == @original_word.downcase
      sort(word) == sort(@original_word) 
    end
  end
end
