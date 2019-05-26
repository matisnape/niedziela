require './lib/holiday_api.rb'
require './lib/checkdate.rb'

class App < Sinatra::Base
  error do
    erb :error
  end

  get '/' do
    @checker = CheckDate.new
    erb :index
  end

  get '/holidays' do
    content_type 'application/json'
    @api ||= ClosedDays::CalendarIndexAPI.new()
    @api.holidays
  end
end
