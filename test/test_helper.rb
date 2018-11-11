ENV['RACK_ENV'] = 'test'

require 'i18n'
require 'minitest/autorun'
require 'rack/test'
require 'pry'

include Rack::Test::Methods
I18n.config.available_locales = :pl

require_relative '../app.rb'
