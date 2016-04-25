# config.ru

require './app'
require './api'

use Rack::Session::Cookie
use ActiveRecord::ConnectionAdapters::ConnectionManagement
run Rack::Cascade.new [API, Sinatra::Application]

