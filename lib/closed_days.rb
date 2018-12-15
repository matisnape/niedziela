module ClosedDays
  def shop_sundays(date)
    [
      first_sunday_of_month(date),
      last_sunday_of_month(date),
      first_sunday_of_month(date.next_month)
    ] + additional_shop_sundays
  end

  def first_sunday_of_month(date)
    first_day_of_month = Date.new(date.year, date.month, 1)
    first_day_of_month - first_day_of_month.wday + 7
  end

  def last_sunday_of_month(date)
    last_day_of_month = Date.new(date.year, date.month, -1)
    last_day_of_month - last_day_of_month.wday
  end

  def additional_shop_sundays
    [
      '2018-12-16',
      '2018-12-23'
    ].map do |item|
      Date.parse(item)
    end
  end

  def additional_holidays
    [
      '2018-11-12'
    ].map do |item|
      Date.parse(item)
    end
  end

  def holidays
    @api ||= CalendarIndexAPI.new()
    @api.holiday_dates
  end

  def holidays_combined
    total = additional_holidays + holidays
    total.uniq.sort
  end
end
