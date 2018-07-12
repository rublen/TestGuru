class AddQuestionCounterToTestPassages < ActiveRecord::Migration[5.1]
  def change
    add_column :test_passages, :question_counter, :integer, default: 1, null: false
  end
end
