require 'json'

class Session

  def initialize(req)
    if req.cookies['_app_session'].nil?
      @cookie = {}
    else
      @cookie = JSON.parse(req.cookies['_app_session'])
    end
  end

  def [](key)
    @cookie[key]
  end

  def []=(key, val)
    @cookie[key]= val
  end

  def store_session(res)
    res.set_cookie('_app_session', @cookie.to_json)
  end
end
