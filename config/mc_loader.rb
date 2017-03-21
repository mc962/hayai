def load_controllers
  dir = File.dirname(__FILE__)
  controllers_directory = File.join(dir, '..', "/controllers")

  controller_files = Dir["#{controllers_directory}/*.rb"]
  controller_files.each do |file|
    require_relative file
  end
end

def load_models
  dir = File.dirname(__FILE__)
  models_directory = File.join(dir, '..', "/models")

  model_files = Dir["#{models_directory}/*.rb"]
  model_files.each do |file|
    require_relative file
  end
end
