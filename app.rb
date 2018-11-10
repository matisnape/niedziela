require 'sinatra'
require './lib/checkdate.rb'

class App < Sinatra::Base
  get '/' do
    @checkdate = CheckDate.new
    erb :index
  end
end
