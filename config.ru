require 'bundler'
Bundler.require

require './app'

use Rack::ContentLength

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  run environment
end

map '/' do
  run App.new
end
