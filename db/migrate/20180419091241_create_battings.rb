class CreateBattings < ActiveRecord::Migration[5.1]
  def change
    create_table :battings do |t|
      t.integer :games
      t.integer :innings
      t.integer :runs
      t.integer :high_score
      t.decimal :average
      t.integer :fifties
      t.integer :hundreds
      t.timestamps
    end
  end
end
