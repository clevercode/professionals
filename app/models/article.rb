class Article < ActiveRecord::Base
  attr_accessible :content, :title, :category_id

  belongs_to :category

  # Number of articles per page
  self.per_page = 9

  # Search
  include PgSearch
  pg_search_scope :search_by_title,
                  :against => [:title, :content],
                  :using => {
                    :tsearch => { prefix: true }
                  }

end
