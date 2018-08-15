class AddColumnToTestPassages < ActiveRecord::Migration[5.1]
  def change
    add_reference :test_passages, :current_question, foreign_key: {to_table: :questions}
  end
end
