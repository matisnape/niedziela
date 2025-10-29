require 'dotenv/load'
require 'pry'
require 'sinatra'
require 'i18n'
require 'sass/embedded'
require 'sinatra/activerecord'

require './app'
require './lib/scrape_holidays.rb'
require './lib/checkdate.rb'
require './models/scraped_date'

template = File.read('public/niedziela.scss')
css = Sass.compile_string(template, style: :compressed)
File.write('public/niedziela.css', css)

I18n.load_path += Dir[File.join(File.dirname(__FILE__), 'locales', '*.yml').to_s]
I18n.default_locale = :pl

set :database_file, 'config/database.yml'

run App
