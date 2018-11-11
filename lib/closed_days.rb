module ClosedDays
  def nonshop_sundays
    [
      '2018-11-11',
      '2018-11-18',
      '2018-12-09'
    ]
  end

  def perm_holidays
    [
      '01-01',
      '01-06',
      '05-01',
      '05-03',
      '08-15',
      '11-01',
      '11-11',
      '11-12',
      '12-25',
      '12-26'
    ].map do |mmdd|
      Time.now.year.to_s + '-' + mmdd
    end
  end
end
