class Question < ActiveRecord::Base
  attr_accessible :email, :message, :name

  # Number of articles per page
  self.per_page = 15

  # Search
  include PgSearch
  pg_search_scope :search_by_name_or_email,
                  :against => [:name, :email],
                  :using => {
                    :tsearch => { prefix: true }
                  }

end
