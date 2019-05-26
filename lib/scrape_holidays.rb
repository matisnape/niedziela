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
      dates = parse_page(doc)
    end

    def parse_page(doc)
      items = doc.css('.cbox table tr td:first-of-type')
      items.each_with_object([]) do |item, dates|
        date_string = item.css('a[data-date]').first.attributes["data-date"].value
        dates << Date.parse(date_string)
      end
    end

    def save_parsed_to_file(arr)
      Dir.mkdir 'scraped' unless File.exist? 'scraped'
      File.open("scraped/scraped_#{Time.now.to_i}.txt", 'w') do |file|
        file.write(arr)
      end
    end


  end
end