class QuestionsController < ApplicationController
  before_filter :authorize, except: [:create]

  # GET /questions
  # GET /questions.json
  def index
    @title = 'Questions'
    @body_class = 'questions'
    @questions = Question.order('created_at DESC').paginate page: params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @body_class = 'questions'
    @question = Question.find(params[:id])
    @title = "Question ##{@question.id}"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    path = params[:path]
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        # Tell the AdminMailer to send a question email after save
        AdminMailer.question_email(@question).deliver

        format.html { redirect_to path, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  def search
    @showAll = false
    @maxQuestions = Question.count
    query = params[:q]
    if query.empty?
      @showAll = true
      @questions = Question.order('created_at DESC').paginate page: 1
    else
      @questions = Question.search_by_name_or_email(query).paginate page: 1
    end

    @noResults = @questions.size < 1
    respond_to :js
  end
end
