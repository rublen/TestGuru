class TestPassagesController < AuthenticatedController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  def gist
    @result = GistQuestionService.new(@test_passage.current_question).call

    if @result.success? && Gist.new(gist_params).save!
      flash[:notice] = "#{t('.success_html', url: @result.gist_url)}"
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def gist_params
    {
      user_id: current_user.id,
      question_id: @test_passage.current_question.id,
      gist_url: @result.gist_url
    }
  end
end
