class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_number_of_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_number_of_answers
    unless question.answers.size <= 4
      errors.add(:base, 'Too many answers for current question: the limit is 4')
    end
  end
end
