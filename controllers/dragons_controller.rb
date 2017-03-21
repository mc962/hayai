require 'rack'
require_relative '../lib/controller_base'
require_relative '../lib/router'
require_relative '../lib/static'
require_relative '../lib/show_exceptions'

DRAGONS = [
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
