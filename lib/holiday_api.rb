require 'httparty'
require_relative '../secrets'

module ClosedDays
  class CalendarIndexAPI
    include HTTParty

    base_uri 'https://www.calendarindex.com/api/v1'

    def initialize
      @options = {
        country: 'PL',
        year: Date.today.year,
        api_key: ENV['CALENDARINDEX']
      }
    end

    def holidays
      response = self.class.get('/holidays', query: @options)
      response['response']['holidays'].to_json
    end

    def holiday_dates
      holiday_hash = JSON.parse(holidays)
      holiday_hash.each_with_object([]) do |item, arr|
        arr << Date.parse(item['date']).to_s
      end
    end
  end
end
