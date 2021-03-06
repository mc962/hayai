require 'pathname'

PROJECT_ROOT_DIR = Pathname.new(__dir__).join("../")

unless ENV['RACK_ENV'] == 'production'
  require 'dotenv'
  Dotenv.load
end

require 'monorm'
MonoRM::DBInitializer.load_db_adapter


require_relative './mc_loader'
load_controllers
load_models


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
  use Rack::MethodOverride
  use ShowExceptions
  use Static
  run app
end.to_app
