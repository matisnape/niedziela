require 'pry'
require 'sinatra'
require 'i18n'
require 'sassc'
require 'sinatra/activerecord'

require './app'
require './lib/scrape_holidays.rb'
require './lib/checkdate.rb'
require './models/scrape_file'

template = File.read('public/niedziela.scss')
css = SassC::Engine.new(template, style: :compressed).render
File.write('public/niedziela.css', css)

I18n.load_path += Dir[File.join(File.dirname(__FILE__), 'locales', '*.yml').to_s]
I18n.default_locale = :pl

set :database_file, 'config/database.yml'

run App
