class GistResultObject

  def initialize(client, result)
    @client = client
    @result = result
  end

  def success?
    @client.is_a?(GitHubClient) ? @result.success? : !@result.blank?
  end

  def gist_url
    @client.is_a?(Octokit::Client) ? @result.html_url : "getting url wasn't implemented for client #{@client.class}"
  end

end

