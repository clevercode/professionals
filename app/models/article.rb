class Article < ActiveRecord::Base
  attr_accessible :content, :title

  # Number of articles per page
  self.per_page = 6

  # Search
  include PgSearch
  pg_search_scope :search_by_title,
                  :against => [:title, :content],
                  :using => {
                    :tsearch => { prefix: true }
                  }

end
