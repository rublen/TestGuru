module QuestionsHelper
  def question_header(question)
    "#{question.persisted? ? 'Edit' : 'Create New'} #{question.test.title} Question"
  end

  def current_year
    Time.current.year
  end

  def link_to_github(author, repo)
    link_to "#{repo} done by #{author} ", "https://github.com/#{author}/#{repo}", target: :_blank
  end
end
