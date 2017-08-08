require 'date'

class Meetup
  WEEKDAYS = { monday: 1, tuesday: 2, wednesday: 3,
               thursday: 4, friday: 5, saturday: 6, sunday: 7 }

  TYPE_INDEX = { first: 0, second: 1, third: 2, fourth: 3, last: -1 }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day, type)
    days = []

    date = Date.new(@year, @month, 1)
    while date.month == @month
      days << date.day if date.cwday == WEEKDAYS[day]
      date = date.next_day
    end

    Date.new(@year, @month, pick_day(days, type))
  end

  def pick_day(days, type)
    return days.select { |num| num > 12 && num < 20 }[0] if type == :teenth

    days[TYPE_INDEX[type]]
  end
end
