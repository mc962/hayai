require 'rack'
require_relative '../lib/controller_base'


DRAGONS = [
  { id: 1, name: "Ryuu", picture_url: '../public/ryuu-pic.jpg' },
  { id: 2, name: "Draco", picture_url: '../public/draco-pic.png' }
]
require 'byebug'
class DragonsController < ControllerBase

  def index
    @dragons = Dragon.all
    render :index
  end

  def show
    
    @dragon = Dragon.find(params['dragon_id'])
    render :show
  end
end
