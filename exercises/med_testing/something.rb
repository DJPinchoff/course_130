class Something
  def initialize(name)
    @name = name
  end

  def self.print_name
    puts name
  end

  def print_name
    puts name
  end
end

s = Something.new("Dave")

s.print_name
