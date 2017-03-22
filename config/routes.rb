ROUTER = Router.new


ROUTER.draw do
  get Regexp.new("^/$"), DragonsController, :index
  get Regexp.new("^/dragons$"), DragonsController, :index
  get Regexp.new("^/dragons/(?<dragon_id>\\d+)"), DragonsController, :show
  get Regexp.new("^/dragons/new$"), DragonsController, :new
  post Regexp.new("^/dragons$"), DragonsController, :create
end
