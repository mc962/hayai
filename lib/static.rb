class Static
  attr_reader :app, :root_path, :file_server
  def initialize(app)
    @app = app
    @root_path = :public
    @file_server = FileServer.new(root_path)
  end

  def call(env)
    req = Rack::Request.new(env)
    path = req.path
    if can_serve?(path)
      res = file_server.call(env)
    else
      res = app.call(env)
    end

    res
  end

  private

  def can_serve?(path)
    path.index("/#{root_path}")
  end
end

class FileServer

  MIME_TYPES = {
      '.css' => 'text/css',
      '.js' => 'application/javascript',
      '.txt' => 'text/plain',
      '.jpg' => 'image/jpeg',
      '.png' => 'image/png',
      '.zip' => 'application/zip',
      '.ico' => 'image/x-icon'
    }

  def initialize(root_path)
    @root_path = root_path
  end

  def call(env)
    res = Rack::Response.new

    file_name = requested_file_name(env)

    if File.exist?(file_name)
      serve_file(file_name, res)
    else
      res.status = 404
      res.write("File not found")
    end
    res
  end

  private

  def serve_file(file_name, res)
    extension = File.extname(file_name)
    content_type = MIME_TYPES[extension]
    file = File.read(file_name)
    res["Content-type"] = content_type
    res.write(file)
  end

  def requested_file_name(env)
    req = Rack::Request.new(env)
    path = req.path
    dir = File.dirname(__FILE__)
    File.join(dir, '..', path)
  end
end
