class BeerSong
  def verse(num)
    if num == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    elsif num == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif num == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    end
  end

  def verses(start, stop)
    numbers = (stop..start).to_a.reverse
    string = ""
    numbers.each do |num|
      string << verse(num)
      string << "\n" unless numbers.last == num
    end

    string
  end

  def lyrics
    verses(99, 0)
  end
end

puts BeerSong.new.verses(2, 0)
