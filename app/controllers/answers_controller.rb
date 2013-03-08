class AnswersController < ApplicationController
  before_filter :authorize, except: [:index, :show, :search]
  before_filter :add_body_class, except: [:create, :update, :destroy]

  def index
    @title = 'FAQ'
    if params[:category_id]
      @category = Category.find params[:category_id]
      @answers = @category.answers.paginate page: params[:page]
    else
      @answers = Answer.paginate page: params[:page]
    end
  end

  def show
    @answer = Answer.find(params[:id])
    @title = "Answer ##{@answer.id}"

    respond_to do |format|
      format.html
      format.json { render json: @answer }
    end
  end

  def new
    @title = 'New FAQ'
    @answer = Answer.new

    respond_to do |format|
      format.html
      format.json { render json: @answer }
    end
  end

  def edit
    @answer = Answer.find(params[:id])
    @title = "Answer ##{@answer.id}"
  end

  def create
    @answer = Answer.new(params[:answer])

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end

  def search
    @showAll = false
    @maxAnswers = Answer.count
    query = params[:q]
    if params[:category_id]
      @category = Category.find params[:category_id]
      @answers = @category.answers
    else
      @answers = Answer
    end

    if query.empty?
      @showAll = true
      @answers = @answers.paginate page: 1
    else
      @answers = @answers.search_by_question(query).paginate page: 1
    end

    @noResults = @answers.size < 1
    respond_to :js
  end

  def add_body_class
    @body_class = 'faq'
  end
end
