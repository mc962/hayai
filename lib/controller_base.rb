require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'active_support/inflector'
require_relative './flash'

class ControllerBase
  attr_reader :req, :res, :params


  def initialize(req, res, route_params = {})
    @req = req
    @res = res
    @params = req.params.merge!(route_params)
  end


  def already_built_response?
    @already_built_response
  end


  def redirect_to(url)
    raise 'Double render error' if already_built_response?
    res.status= 302
    res.location= url

    @already_built_response = true
    session.store_session(res)
    flash.store_flash(res)
    nil
  end

  def render_content(content, content_type)
    raise 'Double render error' if already_built_response?

    self.res.write(content)
    self.res['Content-Type'] = content_type

    @already_built_response = true
    session.store_session(res)
    flash.store_flash(res)
    nil
  end

  def render(template_name)
    directory_path = File.dirname(__FILE__)
    controller_folder = self.class.to_s.underscore

    template_path_name = File.join(directory_path, '..', 'views', controller_folder, "#{template_name}.html.erb")

    raise 'File not found' unless File.file?(template_path_name)
    content_template_code = File.read(template_path_name)
    template = ERB.new(content_template_code).result(binding)
    render_content(template, 'text/html')
  end

  def flash
    @flash ||= Flash.new(req)
  end

  def session
    @session ||= Session.new(req)
  end


  def invoke_action(name)
    self.send(name)
    render(name) unless already_built_response?
  end
end
