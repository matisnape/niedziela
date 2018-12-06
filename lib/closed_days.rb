module ClosedDays
  def shop_sundays(date)
    [
      first_sunday_of_month(date),
      last_sunday_of_month(date),
      first_sunday_of_month(date.next_month)
    ]
  end

  def first_sunday_of_month(date)
    first_day_of_month = Date.new(date.year, date.month, 1)
    first_day_of_month - first_day_of_month.wday + 7
  end

  def last_sunday_of_month(date)
    last_day_of_month = Date.new(date.year, date.month, -1)
    last_day_of_month - last_day_of_month.wday
  end

  def additional_holidays
    [
      '11-12'
    ].map do |mmdd|
      Time.now.year.to_s + '-' + mmdd
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
