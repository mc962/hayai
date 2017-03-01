require 'rack'
require_relative '../lib/controller_base'
require_relative '../lib/router'

$dragons = [
  { id: 1, name: "Ryuu" },
  { id: 2, name: "Draco" }
]

class DragonsController < ControllerBase  
  def index
    render_content($dragons.to_json, 'application/json')
  end

  def show

  end
end

router = Router.new
router.draw do
  get Regexp.new("^/dragons$"), DragonsController, :index
  get Regexp.new("^/dragons/(?<dragon_id>\\d+)"), DragonsController, :show
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  router.run(req, res)
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
