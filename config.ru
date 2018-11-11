require 'pry'
require 'sinatra'
require 'i18n'

require './app'

I18n.load_path += Dir[File.join(File.dirname(__FILE__), 'locales', '*.yml').to_s]
I18n.default_locale = :pl

run App
