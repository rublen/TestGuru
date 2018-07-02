class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, except: [:index, :new, :create]

  def index
    render inline: '<%= @test.questions.map(&:body) %>'
  end
  #/tests/1/questions

  def show
    render inline: '<%= @question.body %>'
  end
  #/questions/1

  def new
  end
  # /tests/1/questions/new

  def create
  end

  private
  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
