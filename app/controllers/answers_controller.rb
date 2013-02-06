class AnswersController < ApplicationController

  def index
    @title = 'FAQ'
    @body_class = 'faq'
    @answers = Answer.paginate page: params[:page]
  end

  def show
    @body_class = 'faq'
    @answer = Answer.find(params[:id])
    @title = "Answer ##{@answer.id}"

    respond_to do |format|
      format.html
      format.json { render json: @answer }
    end
  end

  def new
    @body_class = 'faq'
    @title = 'New FAQ'
    @answer = Answer.new

    respond_to do |format|
      format.html
      format.json { render json: @answer }
    end
  end

  def edit
    @body_class = 'faq'
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
    if query.empty?
      @showAll = true
      @answers = Answer.paginate page: 1
    else
      @answers = Answer.search_by_question(query).paginate page: 1
    end

    @noResults = @answers.size < 1
    respond_to :js
  end
end
