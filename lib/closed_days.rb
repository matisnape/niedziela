module ClosedDays
  def shop_sundays(date)
    # [ last_sunday_of_month(date) ] + additional_shop_sundays
    [
      '2019-12-29',
      '2020-01-26',
      '2020-04-05',
      '2020-04-26',
      '2020-06-28',
      '2020-08-30',
      '2020-12-13',
      '2020-12-20'
    ].map do |item|
      Date.parse(item)
    end
  end

  def last_sunday_of_month(date)
    last_day_of_month = Date.new(date.year, date.month, -1)
    last_day_of_month - last_day_of_month.wday
  end

  def additional_holidays
    [

    ].map do |item|
      Date.parse(item)
    end
  end

  def state_holidays
    ScrapeHolidays.new().run! if ScrapedDate.all.count <= 1

    holidays = ScrapedDate.last.dates

    holidays.map do |item|
      Date.parse(item)
    end
  end

  def holidays_combined
    total = additional_holidays + state_holidays
    total.uniq.sort
  end
end
