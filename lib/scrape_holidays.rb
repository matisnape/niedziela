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
      dates = get_dates_from(doc)
      save_parsed_to_file(dates)
      dates
    end

    def get_dates_from(doc)
      items = doc.css('.cbox table tr td:first-of-type')
      items.each_with_object([]) do |item, dates|
        date_string = item.css('a[data-date]').first.attributes["data-date"].value
        dates << date_string
      end
    end

    def save_parsed_to_file(arr)
      return puts 'File not created, because there are no dates to save.' if arr.empty?

      dir = 'lib/scraped'

      if !File.exist?(dir)
        Dir.mkdir dir
        puts 'New directory created: ' + dir
      end

      file_path = "#{dir}/saved_#{Time.now.to_i}.txt"

      File.open(file_path, 'w') do |file|
        arr.each { |element| file.puts(element) }
      end
      puts 'New file created: ' + file_path
    end
  end
end
