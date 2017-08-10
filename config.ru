require 'bundler'
Bundler.require

require './app'

use Rack::ContentLength

run App.new
