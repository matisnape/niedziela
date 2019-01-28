ENV['RACK_ENV'] = 'test'

require 'i18n'
require 'minitest/autorun'
require 'rack/test'
require 'pry'
require 'timecop'
require 'sinatra'
require_relative '../app.rb'

include Rack::Test::Methods

I18n.load_path += Dir[File.join(File.dirname(__FILE__), '../locales', '*.yml').to_s]
I18n.config.available_locales = :pl

def app
  Sinatra::Application
end

