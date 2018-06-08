class AddNullConstraints < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :name, false
    change_column_null :categories, :title, false
    change_column_null :tests, :title, false
    change_column_null :answers, :correct, false
  end
end
