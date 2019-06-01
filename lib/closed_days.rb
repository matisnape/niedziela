module ClosedDays
  def shop_sundays(date)
    [ last_sunday_of_month(date) ] + additional_shop_sundays
  end

  def last_sunday_of_month(date)
    last_day_of_month = Date.new(date.year, date.month, -1)
    last_day_of_month - last_day_of_month.wday
  end

  def additional_shop_sundays
    [
      '2019-04-14',
      '2019-12-15',
      '2019-12-22',
      '2019-12-29'
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

  def state_holidays
    ScrapeHolidays.new().run! if Dir['lib/scraped/*'].size <= 1

    file_path = Dir['lib/scraped/*'].first

    File.open(file_path) do |file|
      holidays = file.readlines.map(&:chomp)
      holidays.map do |item|
        Date.parse(item)
      end
    end
  end

  def holidays_combined
    total = additional_holidays + state_holidays
    total.uniq.sort
  end
end
