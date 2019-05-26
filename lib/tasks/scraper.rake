require_relative '../scrape_holidays'

namespace :scraper do
  desc "Scrapes a page and saves parsed contents to file"
  task :run do
    ClosedDays::ScrapeHolidays.new.run!
  end
end
