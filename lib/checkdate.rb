require_relative './closed_days.rb'

# TODO: Sundays other than 1st and last in month
class CheckDate
  include ClosedDays

  attr_reader :date
  attr_reader :weekday

  def initialize
    @date = Time.now.to_date
    @weekday = I18n.l(Time.now.to_date, format: '%A')
  end

  def are_shops_closed_today?
    return true if nonshop_sunday? || perm_holiday?
    return false
  end

  def next_sunday
    @date - @date.wday + 7
  end

  def next_sunday_formatted
    next_sunday.strftime('%d.%m')
  end

  def next_sunday_closed?
    return true if nonshop_sunday?(next_sunday.to_s) || perm_holiday?(next_sunday.to_s)
    return false
  end

  def date_as_string
    @date.to_s
  end

  def nonshop_sunday?(date =  date_as_string)
    nonshop_sundays.include?(date)
  end

  def perm_holiday?(date =  date_as_string)
    perm_holidays.include?(date)
  end
end
