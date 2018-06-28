class Answer < ApplicationRecord
  belongs_to :question

  scope :all_right, -> { where correct: true }
end
