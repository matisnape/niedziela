require 'httparty'

module ClosedDays
  class CalendarIndexAPI
    include HTTParty

    base_uri 'https://holidayapi.pl/v1'

    def initialize
      @options = {
        country: 'PL',
        year: Date.today.year
      }
    end

    def holidays
      response = self.class.get('/holidays', query: @options)
      response.parsed_response['holidays'].keys.to_json
    end

    def holiday_dates
      holiday_hash = JSON.parse(holidays)
      holiday_hash.each_with_object([]) do |item, arr|
        arr << Date.parse(item)
      end
    end
  end
end
