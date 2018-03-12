class CreateSponsors < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :website
      t.string :email
      t.string :phone
      t.text :address

      t.timestamps
    end
    add_index :sponsors, :name
  end
end
