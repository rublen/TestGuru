module TestPassagesHelper
  def test_result(test_passage)
    partial = test_passage.success? ? 'success' : 'failure'
    render partial, score: test_passage.score
  end
end
