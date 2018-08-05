class GistQuestionService

  def initialize(question, client: Octokit::Client.new(access_token: ENV['ACCESS_TOKEN']))
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    GistResultObject.new(@client, @client.create_gist(gist_params))
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
