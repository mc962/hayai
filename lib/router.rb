class Route
  attr_reader :pattern, :http_method, :controller_class, :action_name

  def initialize(pattern, http_method, controller_class, action_name)
    @pattern = pattern
    @http_method = http_method
    @controller_class = controller_class
    @action_name = action_name
  end


  def matches?(req)
    req.request_method.downcase.to_sym == @http_method && @pattern =~ req.path
  end


  def run(req, res)

    data = req.path.match(pattern)
    params = {}
    data.names.each do |name|
      params[name] = data[name]
    end
    controller = controller_class.new(req, res, params)
    controller.invoke_action(action_name.to_sym)
  end
end

class Router
  attr_reader :routes

  def initialize
    @routes = []
    # load_controllers
  end



  def add_route(pattern, method, controller_class, action_name)
    @routes << Route.new(pattern, method, controller_class, action_name)
  end

  def draw(&proc)
    self.instance_eval(&proc)
  end

  [:get, :post, :put, :delete].each do |http_method|
    define_method(http_method) do |pattern, controller_class, action_name|
      add_route(pattern, http_method, controller_class, action_name)
    end
  end

  def match(req)
    routes.each do |route|

      if req.send(:"#{route.http_method}?") && (req.path.match(route.pattern))
        return route
      end
    end
    nil
  end

  def run(req, res)

    potential_route = match(req)
    if potential_route
      potential_route.run(req, res)
    else
      res.status = 404
      res.body << "#{potential_route} not found"
    end
  end
end
