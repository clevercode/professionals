class Answer < ActiveRecord::Base
  attr_accessible :content, :question

  # Number of articles per page
  self.per_page = 10

end
