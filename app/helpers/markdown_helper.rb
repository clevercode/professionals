module MarkdownHelper
  def redcarpet(text)
    raw Haml::Filters::Redcarpet.markdown.render(text)
  end
end
