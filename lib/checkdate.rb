require_relative './closed_days.rb'

# TODO: Sundays other than 1st and last in month
class CheckDate
  include ClosedDays

  attr_reader :current_date

  def initialize
    @current_date = Time.now.to_date
  end

  def are_shops_closed_today?
    return "Zamknięte" if nonshop_sunday? || perm_holiday?
    return "Otwarte"
  end

  def next_sunday
    @current_date - @current_date.wday + 7
  end

  def next_sunday_formatted
    next_sunday.strftime('%d.%m')
  end

  def next_sunday_closed?
    return "Zamknięte" if nonshop_sunday?(next_sunday.to_s) || perm_holiday?(next_sunday.to_s)
    return "Otwarte"
  end

  def current_date_as_string
    @current_date.to_s
  end

  def nonshop_sunday?(date =  current_date_as_string)
    nonshop_sundays.include?(date)
  end

  def perm_holiday?(date =  current_date_as_string)
    perm_holidays.include?(date)
  end
end
