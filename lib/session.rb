require 'json'

class Session

  def initialize(req)
    if req.cookies['_rails_lite_app'].nil?
      @cookie = {}
    else
      @cookie = JSON.parse(req.cookies['_rails_lite_app'])
    end
  end

  def [](key)
    @cookie[key]
  end

  def []=(key, val)
    @cookie[key]= val
  end

  def store_session(res)
    res.set_cookie("_rails_lite_app", value: @cookie.to_json, path: '/')
  end
end
