require 'rack'
require_relative '../lib/static'
require_relative '../lib/show_exceptions'

require_relative '../lib/router'
require_relative './routes.rb'



app = Proc.new do |env|

  req = Rack::Request.new(env)
  res = Rack::Response.new
  ROUTER.run(req, res)
  res.finish
end

APP = Rack::Builder.new do
  use ShowExceptions
  use Static
  run app
end.to_app
