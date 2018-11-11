module ClosedDays
  def nonshop_sundays
    [
      '2018-11-11',
      '2018-11-18',
      '2018-12-09'
    ]
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
