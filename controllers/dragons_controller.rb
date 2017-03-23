require 'rack'
require_relative '../lib/controller_base'


require 'byebug'
class DragonsController < ControllerBase

  def index
    @dragons = Dragon.all
    render :index
  end

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

  def show
    @dragon = Dragon.find(params['dragon_id'])
    render :show
  end

  def edit
    @available_riders = Rider.all
    @dragon = Dragon.find(params['dragon_id'])
    render :edit
  end

  def update
    @dragon = Dragon.new(id: params['dragon_id'], name: params['dragon']['name'], picture_url: params['dragon']['picture_url'], rider_id: params['dragon']['rider_id'])

    if @dragon.update
      redirect_to("/dragons/#{@dragon.id}")
    else
      flash.now[:errors] = 'Invalid fields'
    end
  end

  def destroy
    @dragon = Dragon.find(params['dragon_id'])
    if @dragon
      @dragon.destroy
    end
    redirect_to("/dragons")
  end
end
