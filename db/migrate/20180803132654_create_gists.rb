class CreateGists < ActiveRecord::Migration[5.1]
  def change
    create_table :gists do |t|
      t.integer :user_id, foreign_key: true
      t.integer :question_id, foreign_key: true
      t.string :gist_url, null: false
    end
  end
end
