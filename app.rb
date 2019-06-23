class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
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

    if ScrapedDate.all.count == 0
      @scrape = ClosedDays::ScrapeHolidays.new().run!
    else
      @scrape = ScrapedDate.last.dates
    end

    @scrape.to_json
  end
end
