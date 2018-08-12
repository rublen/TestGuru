class Remove < ActiveRecord::Migration[5.1]
  def change
    change_column_default :tests, :level, nil
  end
end
