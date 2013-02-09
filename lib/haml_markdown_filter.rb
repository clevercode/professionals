module Haml::Filters::Redcarpet
  include Haml::Filters::Base

  def render(text)
    Haml::Filters::Redcarpet.markdown.render(text) 
  end
  
  def self.markdown
    @markdown ||= Redcarpet::Markdown.new(Haml::Filters::Redcarpet.renderer,
                                         :fenced_code_blocks => true,
                                         :autolink => true)
  end
  def self.renderer
    @renderer ||= Redcarpet::Render::HTML.new()
  end
end
