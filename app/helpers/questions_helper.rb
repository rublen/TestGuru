module QuestionsHelper
  def question_header
    test = params[:test_id] ? Test.find(params[:test_id]) : Test.find_by_id(@question.test_id)
    "#{@question.persisted? ? 'Edit' : 'Create New'} #{test.title} Question"
  end

  def current_year
    Time.current.year
  end

  def link_to_github(author, repo)
    link_to "#{repo} done by #{author} ", "https://github.com/#{author}/#{repo}", target: :_blank
  end
end
