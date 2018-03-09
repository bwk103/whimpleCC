class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :surname
      t.string :email
      t.string :team

      t.timestamps
    end
    add_index :players, :surname
    add_index :players, :team
  end
end
