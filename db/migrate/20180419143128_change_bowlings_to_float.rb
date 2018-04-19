class ChangeBowlingsToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :bowlings, :economy, :float
    change_column :bowlings, :strike_rate, :float
    change_column :bowlings, :average, :float
  end
end
