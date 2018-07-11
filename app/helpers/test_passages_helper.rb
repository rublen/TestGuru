module TestPassagesHelper
  def test_result(score)
    render score >= 85 ? 'success' : 'failure'
  end
end
