require 'rack'
require_relative '../lib/controller_base'


require 'byebug'

class MemoriesController < ControllerBase

  def create
    @memory = Memory.new(location: params['memory']['location'], content: params['memory']['content'], dragon_id: params['memory']['dragon_id'])

    unless @memory.save
      flash[:errors] = 'Invalid fields'
    end
      redirect_to("/dragons/#{@memory.dragon_id}")
  end

  def destroy
    @memory = Memory.find(params['memory_id'])

    if @memory
      @memory.destroy
    end
    redirect_to("/dragons/#{@memory.dragon_id}")
  end

end
