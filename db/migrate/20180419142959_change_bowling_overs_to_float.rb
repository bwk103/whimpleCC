class ChangeBowlingOversToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :bowlings, :overs, :float
  end
end
