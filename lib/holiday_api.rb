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

    def get_holidays
      response = self.class.get("/holidays", query: @options)
      response["response"]["holidays"].to_json
    end
  end
end
