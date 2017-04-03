ROUTER = Router.new


ROUTER.draw do
  get Regexp.new("^/$"), DragonsController, :index

  get Regexp.new("^/dragons$"), DragonsController, :index
  get Regexp.new("^/dragons/(?<dragon_id>\\d+)$"), DragonsController, :show

  get Regexp.new("^/dragons/new$"), DragonsController, :new
  post Regexp.new("^/dragons$"), DragonsController, :create

  get Regexp.new("^/dragons/(?<dragon_id>\\d+)/edit$"), DragonsController, :edit
  patch Regexp.new("^/dragons/(?<dragon_id>\\d+)$"), DragonsController, :update

  delete Regexp.new("^/dragons/(?<dragon_id>\\d+)$"), DragonsController, :destroy

  post Regexp.new("^/memories$"), MemoriesController, :create
  delete Regexp.new("/memories/(?<memory_id>\\d+)$"), MemoriesController, :destroy

  get Regexp.new("^/riders$"), RidersController, :index
  get Regexp.new("^/riders/new$"), RidersController, :new
  post Regexp.new("^/riders$"), RidersController, :create

  get Regexp.new("^/riders/(?<rider_id>\\d+)/edit$"), RidersController, :edit
  patch Regexp.new("^/riders/(?<rider_id>\\d+)$"), RidersController, :update

  delete Regexp.new("^/riders/(?<rider_id>\\d+)$"), RidersController, :destroy


end
