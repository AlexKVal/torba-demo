require 'bundler'
Bundler.require

require './app'

use Rack::ContentLength

map '/assets' do
  env = Sprockets::Environment.new

  env.append_path 'app/assets/javascripts'
  env.append_path 'app/assets/stylesheets'
  Torba.load_path.each do |path|
    env.append_path(path)
  end

  if ENV['RACK_ENV'] == 'production'
    env.js_compressor  = Uglifier.new(harmony: true)
    env.css_compressor = :scss
  else
    env.register_bundle_processor 'text/css', Sprockets::SassCompressor.new({ style: :expanded })
  end

  run env
end

map '/' do
  run App.new
end
