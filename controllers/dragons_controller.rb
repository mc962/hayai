require 'rack'
require_relative '../lib/controller_base'


require 'byebug'
class DragonsController < ControllerBase

  def new
    @dragon = Dragon.new
    render :new
  end

  def create
  end

  def index
    @dragons = Dragon.all
    render :index
  end

  def show
    @available_riders = Rider.all
    @dragon = Dragon.find(params['dragon_id'])
    render :show
  end
end
