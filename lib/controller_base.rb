require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'active_support/inflector'

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
    session.store_session(@res)

    @already_built_response = true
  end

  def render_content(content, content_type)
    raise 'Double render error' if already_built_response?
    session.store_session(@res)
    self.res.write(content)
    self.res['Content-Type']= content_type

    @already_built_response = true
  end

  def render(template_name)
    file_path = "../views/#{self.class.to_s.underscore}/#{template_name}.html.erb"
    raise 'File not found' unless File.file?(file_path)
    html_content = File.open(file_path).read

    template = ERB.new(html_content).result(binding)
    render_content(template, 'text/html')
  end

  def session
    @session ||= Session.new(@req)
  end

  def invoke_action(name)
    path_attribs = req.path.split('/')
    possible_controllers = []

    path_attribs.each do |attrib|
      break if :"#{attrib}" == name
      possible_controllers << attrib
    end

    target_controller = possible_controllers.last
    target_controller_name = "#{target_controller.pluralize.capitalize}Controller"
    unless self.send(:"#{name}")
      render(name)
    end
  end
end
