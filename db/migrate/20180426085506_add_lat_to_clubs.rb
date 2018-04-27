class AddLatToClubs < ActiveRecord::Migration[5.1]
  def change
    add_column :clubs, :lat, :float
    add_column :clubs, :lng, :float 
  end
end
