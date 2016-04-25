# config.ru

require './app'
require './api'
require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :get
  end
end

use Rack::Session::Cookie
use ActiveRecord::ConnectionAdapters::ConnectionManagement
run Rack::Cascade.new [API, Sinatra::Application]

