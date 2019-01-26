require 'pry'
require 'sinatra'
require 'i18n'
require 'sassc'

require './app'

template = File.read('public/niedziela.scss')
css = SassC::Engine.new(template, style: :compressed).render
File.write('public/niedziela.css', css)

I18n.load_path += Dir[File.join(File.dirname(__FILE__), 'locales', '*.yml').to_s]
I18n.default_locale = :pl

run App
