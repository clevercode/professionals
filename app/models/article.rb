class Article < ActiveRecord::Base
  attr_accessible :content, :title, :keyword
end
