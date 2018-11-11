require 'sinatra'
require 'i18n'
require './lib/checkdate.rb'

class App < Sinatra::Base
  get '/' do
    @today = CheckDate.new
    erb :index
  end
end
