class ArticlesController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  # GET /articles
  # GET /articles.json
  def index
    @title = 'Articles'
    @body_class = 'articles'
    @articles = Article.order(:title).paginate page: params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @body_class = 'articles'
    @article = Article.find(params[:id])
    @title = "Article ##{@article.id}"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @body_class = 'articles'
    @title = 'New Article'
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @body_class = 'articles'
    @article = Article.find(params[:id])
    @title = "Article ##{@article.id}"
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  def search
    @showAll = false
    @maxArticles = Article.count
    query = params[:q]
    if query.empty?
      @showAll = true
      @articles = Article.paginate page: 1
    else
      @articles = Article.search_by_title(query).paginate page: 1
    end

    @noResults = @articles.size < 1
    respond_to :js
  end
end
