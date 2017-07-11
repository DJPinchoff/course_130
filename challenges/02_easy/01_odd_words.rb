=begin
Consider a charater set consisting of letters, a space, and a point. Words consist of one or more, but at most 20 letters. An input text consists of one or more words separated from each other by one or more spaces and terminated by 0 or more spaces followed by a point. Input should be read from, and including, the first letter of the first word, up to and including the terminating point. The output text is to be produced such that successive words are separated by a single space with the last word being terminated by a single point. Odd words are copied in reverse order while even words are merely echoed. For example, the input string

"whats the matter with kansas." becomes
"whats eht matter htiw kansas."

BONUS: The characters must be read and printed one at a time.

-Split words into array
-Build string by iterating through split_array
-If index is 0, don't add a " ", otherwise, do
  -Separate
  -If index is odd, reverse word
  -Print each char of the word.concatenate the word whether it's odd or even
-If index is -1, add a "."

=end

class Reverser
  def initialize(sentence)
    @sentence = sentence
  end

  def print_processed_words(words)
    words.each_with_index do |word, index|
      print " " unless index.zero?
      word.each { |letter| print letter }
      puts "." if words.last == word
    end
  end

  def print_odd_index_words_reversed
    words = @sentence.split(/\W+/)
    processed_words = []
    words.each_with_index do |word, index|
      letters = if index.odd?
                  word.chars.reverse
                else
                  word.chars
                end
      processed_words << letters
    end

    print_processed_words(processed_words)
  end
end

reverser = Reverser.new("whats the matter with kansas.")
reverser.print_odd_index_words_reversed
