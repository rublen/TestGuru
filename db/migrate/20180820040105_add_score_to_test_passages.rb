class AddScoreToTestPassages < ActiveRecord::Migration[5.1]
  def change
    add_column :test_passages, :score, :integer, null: false, default: 0
  end
end
