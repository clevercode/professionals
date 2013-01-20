class PagesController < ApplicationController

  def home
    @title = 'Home'
    @body_class = 'home'
    @answers = Answer.limit(6)
    @articles = Article.limit(3)
  end

  def about
    @title = 'About'
    @body_class = 'about'
  end

  def contact
    @title = 'Contact'
    @body_class = 'contact'
  end
end

