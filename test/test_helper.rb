ENV['RACK_ENV'] = 'test'

require 'i18n'
require 'minitest/autorun'
require 'rack/test'
require 'pry'
require 'timecop'
require 'sinatra'
require_relative '../app.rb'
require_relative './test_niedziela.rb'

include Rack::Test::Methods

I18n.config.available_locales = :pl

t = Time.local(2019, 1, 1, 10, 00, 0)
Timecop.travel(t)

def app
  Sinatra::Application
end

