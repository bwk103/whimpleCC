class AddPaidEventToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :ticketed, :boolean, default: false
  end
end
