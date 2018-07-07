class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new, :create]
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end
  #/tests/1/questions

  def new
    @question = Question.new
  end
  # /tests/1/questions/new

  def show
    @question
  end
  #/questions/1

  def edit
    # @test = Test.find_by_id(@question.test_id)
  end
  #/questions/1/edit

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update!(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @test = Test.find_by_id(@question.test_id)
    @question.destroy
    redirect_to test_questions_path(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
