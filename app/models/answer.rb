class Answer < ActiveRecord::Base
  attr_accessible :content, :question

  # Number of articles per page
  self.per_page = 10

  # Search
  include PgSearch
  pg_search_scope :search_by_question,
                  :against => :question,
                  :using => {
                    :tsearch => { prefix: true }
                  }

end
