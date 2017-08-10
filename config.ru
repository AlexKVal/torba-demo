require 'bundler'
Bundler.require

require './app'

use Rack::ContentLength

map '/assets' do
  environment = Sprockets::Environment.new

  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'

  environment.js_compressor  = Uglifier.new(harmony: true)
  environment.css_compressor = :scss

  run environment
end

map '/' do
  run App.new
end
