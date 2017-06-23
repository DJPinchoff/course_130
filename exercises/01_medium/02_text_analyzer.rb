class TextAnalyzer
  def process
    paragraph_count = 1
    line_count = 0
    word_count = 0

    File.open(yield) do |file|
      file.each_line do |line|
        line_count += 1
        paragraph_count += 1 if line == "\n"
        line.split.each do |word|
          word_count += 1
        end
      end

    end

    puts "#{paragraph_count} paragraphs"
    puts "#{line_count} lines"
    puts "#{word_count} words"
  end
end

analyzer = TextAnalyzer.new
analyzer.process { "text.txt" }
# analyzer.process { puts your implementation }
# analyzer.process { puts your implementation }
