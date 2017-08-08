class Clock
  def initialize(hours, mins=0)
    @hours = hours
    @mins = mins
  end

  def self.at(hours, mins=0)
    Clock.new(hours, mins)
  end

  def +(more_mins)
    @mins += more_mins
    if @mins > 60
      more_hours, @mins = @mins.divmod(60)
      @hours += more_hours
      @hours = @hours % 24
    end

    Clock.new(@hours, @mins)
  end

  def -(less_mins)
    @mins -= less_mins
    if @mins < 0
      less_hours, @mins = @mins.abs.divmod(60)
      binding.pry
      @hours = @hours - less_hours - 1
      @hours = @hours % 24
    end

    Clock.new(@hours, @mins)
  end

  def ==(other_clock)
    self.to_s == other_clock.to_s
  end

  def to_s
    "#{format('%02d', @hours)}:#{format('%02d', @mins)}"
  end
end
