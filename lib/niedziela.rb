# TODO: Sundays other than 1st and last in month
class CheckDate
  NonShopSundays = [
    '2018-11-11',
    '2018-11-18',
    '2018-12-09'
  ]

  PermHolidays = [
    '01-01',
    '01-06',
    '05-01',
    '05-03',
    '08-15',
    '11-01',
    '11-11',
    '12-25',
    '12-26'
  ]

  def initialize
    @date = Date.today
end


