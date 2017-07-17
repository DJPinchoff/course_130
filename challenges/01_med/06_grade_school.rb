class School
  def initialize
    @school = {}
  end

  def add(name, grade)
    @school[grade] = Array.new unless @school[grade]
    @school[grade] << name
    @school[grade].sort!
  end

  def grade(grade)
    @school[grade].nil? ? [] : @school[grade]
  end

  def to_h
    @school.sort.to_h
  end
end
