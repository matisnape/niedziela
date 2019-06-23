require 'nokogiri'
require 'open-uri'
require 'pry'
require 'sinatra/activerecord'
require './models/scraped_date'

module ClosedDays
  class ScrapeHolidays

    def initialize
      @year = Date.today.year.to_s
      @url = 'https://www.kalendarzswiat.pl/swieta/wolne_od_pracy/'
    end

    def run!
      doc = Nokogiri::HTML(open(@url + @year))
      dates = get_dates_from(doc)
      save_parsed_to_db(dates)
    end

    def get_dates_from(doc)
      items = doc.css('.cbox table tr td:first-of-type')
      items.each_with_object([]) do |item, dates|
        date_string = item.css('a[data-date]').first.attributes["data-date"].value
        dates << date_string
      end
    end

    def save_parsed_to_db(arr)
      return puts 'Entry not created, because there are no dates to save.' if arr.empty?

      ScrapedDate.create(dates: arr)

      puts 'New entry created'
      ScrapedDate.last.dates
    end
  end
end
