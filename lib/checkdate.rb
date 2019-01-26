require_relative './closed_days.rb'

# TODO: Sundays other than 1st and last in month
class CheckDate
  include ClosedDays

  attr_accessor :reason
  def today
    Time.now.to_date
  end
  def full_date
    I18n.l(today)
  end

  end

  def are_shops_closed_today?
    if holiday?
      @reason = I18n.t('app.reason.holiday')
      return true
    elsif nonshop_sunday?
      @reason = I18n.t('app.reason.niehandlowa')
      return true
    end
    false
  end

  def next_sunday
    today - today.wday + 7
  end

  def next_sunday_formatted
    I18n.l(next_sunday, format: :day_month)
  end
  end

  def next_sunday_closed?
    holiday?(next_sunday) || nonshop_sunday?(next_sunday)
  end

  private

  def nonshop_sunday?(date = today)
    date.wday == 0 && !shop_sundays(today).include?(date)
  end

  def holiday?(date =  today)
    holidays_combined.include?(date)
  end
end
