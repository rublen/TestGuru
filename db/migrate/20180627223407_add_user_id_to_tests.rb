class AddUserIdToTests < ActiveRecord::Migration[5.1]
  def change
    add_reference :tests, :user, foreign_key: true
  end
end
