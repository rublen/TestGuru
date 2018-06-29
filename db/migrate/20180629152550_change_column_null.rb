class ChangeColumnNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :email, false
    change_column_null :questions, :body, false
    change_column_null :answers, :body, false
  end
end
