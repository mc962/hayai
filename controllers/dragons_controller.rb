require 'rack'
require_relative '../lib/controller_base'
require_relative '../lib/router'
require_relative '../lib/static'
require_relative '../lib/show_exceptions'

DRAGONS = [
  # { id: 1, name: "Ryuu", picture_url: 'http://orig10.deviantart.net/9231/f/2014/039/c/2/c2d21022ee46616b6257dfd3a330f1b9-d75mzg9.jpg' },
  # { id: 2, name: "Draco", picture_url: 'https://upload.wikimedia.org/wikipedia/commons/f/ff/800x480-Y_Ddraig_Goch.png' }
  { id: 1, name: "Ryuu", picture_url: '../public/ryuu-pic.jpg' },
  { id: 2, name: "Draco", picture_url: '../public/draco-pic.png' }
]

class DragonsController < ControllerBase

  def index
    @dragons = DRAGONS
    render :index
  end

  def show
    @dragon = DRAGONS[params["dragon_id"].to_i-1]
    render :show
  end
end

router = Router.new
router.draw do
  get Regexp.new("^/$"), DragonsController, :index
  get Regexp.new("^/dragons$"), DragonsController, :index
  get Regexp.new("^/dragons/(?<dragon_id>\\d+)"), DragonsController, :show
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  router.run(req, res)
  res.finish
end

app = Rack::Builder.new do
  use ShowExceptions
  use Static
  run app
end.to_app

Rack::Server.start(
  app: app,
  Port: 3000
)
