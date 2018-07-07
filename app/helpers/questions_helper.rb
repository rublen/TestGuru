module QuestionsHelper
  def test_title
    if @test
      @test.title
    else
      Test.find_by_id(@question.test_id).title
    end
  end

  def current_year
    Time.now.year
  end

  def link_to_github(author, repo)
    link_to "#{repo} done by #{author} ", "https://github.com/#{author}/#{repo}"
  end
end
