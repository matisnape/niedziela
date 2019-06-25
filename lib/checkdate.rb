require_relative './closed_days.rb'

# TODO: Sundays other than 1st and last in month
class CheckDate
  include ClosedDays

  attr_reader :input_date

  def initialize(input_date = today)
    @input_date = input_date
    @holidays_combined = holidays_combined
  end

  def full_date
    I18n.l(@input_date)
  end

  def reason
    return I18n.t('app.reason.holiday') if holiday?
    return I18n.t('app.reason.niehandlowa') if nonshop_sunday?
    nil
  end

  def next_sunday_formatted
    I18n.l(next_sunday, format: :day_month)
  end

  def next_sunday_status
    day_status(next_sunday)
  end

  def today_status
    day_status(@input_date)
  end

  private

  def today
    Time.now.to_date
  end

  def next_sunday
    @input_date - @input_date.wday + 7
  end

  def nonshop_sunday?(date = @input_date)
    date.wday == 0 && !shop_sundays(date).include?(date)
  end

  def holiday?(date = @input_date)
    @holidays_combined.include?(date)
  end

  def day_status(date)
    if holiday?(date) || nonshop_sunday?(date)
      return :closed
    end
    :open
  end
end
