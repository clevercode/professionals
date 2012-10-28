class Article < ActiveRecord::Base
  attr_accessible :content, :title

  def formatted_content
    self.content.gsub(/\n/, '<br/>').html_safe
  end

  def content_too_long?
    self.content.length > 200
  end
end
