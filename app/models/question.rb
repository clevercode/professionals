class Question < ActiveRecord::Base
  attr_accessible :email, :message, :name

  # Number of articles per page
  self.per_page = 15

end
