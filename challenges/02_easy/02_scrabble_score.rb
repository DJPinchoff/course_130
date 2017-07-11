class Scrabble
  LETTER_VALUES = { 1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
                    2 => ["d", "g"],
                    3 => ["b", "c", "m", "p"],
                    4 => ["f", "h", "v", "w", "y"],
                    5 => ["k"],
                    8 => ["j", "x"],
                    10 => ["q", "z"] }

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil?
    score = 0
    letters = @word.downcase.chars
    letters.each do |letter|
      LETTER_VALUES.each do |points, values|
        score += points if values.include? letter
      end
    end

    score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
