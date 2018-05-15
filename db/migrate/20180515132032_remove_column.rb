class RemoveColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :fixtures, :date
    remove_column :fixtures, :time
  end
end
