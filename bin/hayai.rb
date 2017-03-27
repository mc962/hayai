# require "bundler/setup"
require_relative '../config/boot'

Rack::Server.start(
  app: APP,
  Port: 3000
)
