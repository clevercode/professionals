class Article < ActiveRecord::Base
  attr_accessible :content, :title

  # Number of articles per page
  self.per_page = 9

end
