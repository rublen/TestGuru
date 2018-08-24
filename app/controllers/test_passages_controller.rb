class TestPassagesController < AuthenticatedController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      current_user.badges << UserBadgesService.new(@test_passage).call
      flash[:alert] = t('.time_out') if @test_passage.time_out?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  def gist
    @result = GistQuestionService.new(@test_passage.current_question).call

    if @result.success?
      flash[:notice] = t('.success_html', url: @result.gist_url)
      Gist.new(gist_params).save!
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
    { user: current_user,
      question: @test_passage.current_question,
      gist_url: @result.gist_url }
  end
end
