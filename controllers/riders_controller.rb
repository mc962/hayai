require 'rack'
require_relative '../lib/controller_base'

require 'byebug'

class RidersController < ControllerBase

  def index
    @riders = Rider.all
    render :index
  end

  def new
    @rider = Rider.new
    render :new
  end

  def create
    @rider = Rider.new(fname: params['rider']['fname'], lname: params['rider']['lname'])

    if @rider.save
      redirect_to('/riders')
    else
      flash.now[:errors] = 'Invalid fields'
      render :new
    end
  end

  def edit
    @rider = Rider.find(params['rider_id'])
    render :edit
  end

  def update
    @rider = Rider.new(id: params['rider_id'], fname: params['rider']['fname'], lname: params['rider']['lname'])

    if @rider.update
      redirect_to('/riders')
    else
      flash.now[:errors] = 'Invalid fields'
      render :edit
    end
  end

  def destroy
    @rider = Rider.find(params['rider_id'])
    if @rider
      @rider.destroy
    end

    redirect_to('/riders')
  end
end
