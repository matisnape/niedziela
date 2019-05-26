require 'nokogiri'
require 'open-uri'

module ClosedDays
  class ScrapeHolidays

    def initialize
      @year = Date.today.year.to_s
      @url = 'https://www.kalendarzswiat.pl/swieta/wolne_od_pracy/'
    end

    def run!
      doc = Nokogiri::HTML(open(@url + @year))
      items = doc.css('.cbox table tr td:first-of-type')
      items.each_with_object([]) do |item, dates|
        date_string = item.css('a[data-date]').first.attributes["data-date"].value
        dates << Date.parse(date_string)
      end
    end
  end
end
