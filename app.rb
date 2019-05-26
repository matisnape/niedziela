require './lib/scrape_holidays.rb'
require './lib/checkdate.rb'

class App < Sinatra::Base
  # disable :show_exceptions

  error do
    erb :error
  end

  get '/' do
    @checker = CheckDate.new
    erb :index
  end

  get '/holidays' do
    content_type 'application/json'
    @scrape ||= ClosedDays::ScrapeHolidays.new()
    @scrape.run!.to_json
  end
end
