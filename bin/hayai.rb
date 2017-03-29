# require "bundler/setup"
require_relative '../config/boot'

# temporary wrapper method to call server start from config.ru for easier code understanding
def start_server
  if ENV['RACK_ENV'] == 'production'
    run APP
  else
    Rack::Server.start(
    app: APP,
    Port: $PORT
    )
  end
end
