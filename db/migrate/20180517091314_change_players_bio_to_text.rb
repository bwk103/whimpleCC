class ChangePlayersBioToText < ActiveRecord::Migration[5.1]
  def change
    change_column :players, :bio, :text
  end
end
