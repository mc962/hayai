require 'json'

class Flash
  attr_reader :now

  def initialize(req)
    flash_cookie = req.cookies['_hayai_app_flash']

    if flash_cookie
      @now = JSON.parse(flash_cookie)
    else
      @now = {}
    end

    @flash = {}
  end

  def [](key)
    @now[key.to_s] || @flash[key.to_s]
  end

  def []=(key, val)
    @flash[key.to_s] = val
  end


  def store_flash(res)
    res.set_cookie('_hayai_app_flash', value: @flash.to_json, path: '/')
  end
end
