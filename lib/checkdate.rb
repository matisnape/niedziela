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
      @reason = I18n.t('app.reason.holiday')
      return true
    elsif nonshop_sunday?
      @reason = I18n.t('app.reason.niehandlowa')
      return true
    end
    false
  end

  def next_sunday
    @date - @date.wday + 7
  end

  def next_sunday_formatted
    next_sunday.strftime('%d.%m')
  end

  def next_sunday_closed?
    holiday?(next_sunday) || nonshop_sunday?(next_sunday) || holiday?(next_sunday)
  end

  def nonshop_sunday?(date = @date)
    date.wday == 0 && !shop_sundays(@date).include?(date)
  end

  def holiday?(date =  @date)
    holidays_combined.include?(date)
  end
end
