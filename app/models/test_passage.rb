class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.question_counter += 1
    self.score = count_score
    save!
  end

  def count_score
    (correct_questions * 100.0 / test.questions.count).round(2)
  end

  def success?
    count_score >= 80
  end

  private

  def before_save_set_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    Array(answer_ids).map(&:to_i).sort == correct_answers.ids.sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question
      test.questions.order(:id).where('id > ?', current_question.id).first
    else
      test.questions.order(:id).first
    end
  end
end
