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
    save!
  end

  def score
    (correct_questions * 100.0 / test.questions.count).round(2)
  end

  private

  def before_save_set_question
    return unless test.present?
    if question_counter == 1
      self.current_question = test.questions.order(:id).first
    else
      self.current_question = next_question
    end
  end

  def correct_answer?(answer_ids)
    answer_ids.map(&:to_i).sort == correct_answers.ids.sort if answer_ids
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
