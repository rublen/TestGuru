class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new, :create]
  before_action :find_question, except: [:index, :new, :create]

  def index
    render inline: '<%= @test.questions.join("\n") %>'
  end
  #/tests/1/questions

  def show
    render plain: @question.inspect
  end
  #/questions/1

  def new; end
  # /tests/1/questions/new

  def create
    @question = @test.questions.create!(question_params)
    redirect_to @question
  end

  def destroy
    @test = Test.find(@question.test_id)
    @question.destroy
    index
  end
  #/questions/15/delete

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
end
