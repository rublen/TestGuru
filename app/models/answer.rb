class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :all_right, -> { where correct: true }
end
