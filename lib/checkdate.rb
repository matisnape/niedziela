require_relative './closed_days.rb'

# TODO: Sundays other than 1st and last in month
class CheckDate
  include ClosedDays

  attr_reader :date
  attr_reader :full_date
  attr_accessor :reason

  def initialize
    @date = Time.now.to_date
    @full_date = I18n.l(Time.now.to_date, format: '%A, %d. %B')
  end

  def are_shops_closed_today?
    if holiday?
      @reason = 'święto'
      return true
    elsif nonshop_sunday?
      @reason = 'niedziela'
      return true
    end
    return false
  end

  def next_sunday
    @date - @date.wday + 7
  end

  def next_sunday_formatted
    next_sunday.strftime('%d.%m')
  end

  def next_sunday_closed?
    return true if nonshop_sunday?(next_sunday.to_s) || holiday?(next_sunday.to_s)
    return false
  end

  def date_as_string
    @date.to_s
  end

  def nonshop_sunday?(date =  date_as_string)
    nonshop_sundays.include?(date)
  end

  def holiday?(date =  date_as_string)
    holidays_combined.include?(date)
  end
end
