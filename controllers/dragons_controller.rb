require 'rack'
require_relative '../lib/controller_base'



class DragonsController < ControllerBase

  def new
    @available_riders = Rider.all
    @dragon = Dragon.new
    render :new
  end

  def create
    @dragon = Dragon.new(name: params['dragon']['name'], picture_url: params['dragon']['picture_url'], rider_id: params['dragon']['rider_id'])

    # @dragon.picture_url = "/public/#{params['dragon']['picture_url']}"

    if @dragon.save
      redirect_to('/dragons')
    else
      flash.now[:errors] = 'Invalid fields'
    end
  end

  def index
    @dragons = Dragon.all
    render :index
  end

  def show
    @dragon = Dragon.find(params['dragon_id'])
    render :show
  end
end
