class GistResultObject
  attr_reader :result, :service

  def initialize(question)
    @service = GistQuestionService.new(question)
    @result = @service.call
  end

  def success?
    @service.client.is_a?(GitHubClient) ? @result.success? : !@result.blank?
  end

  def gist_url
    @service.client.is_a?(Octokit::Client) ? @result.html_url : "getting url wasn't implemented for client #{@service.client.class}"
  end

end
