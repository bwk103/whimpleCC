class CreateBowlings < ActiveRecord::Migration[5.1]
  def change
    create_table :bowlings do |t|
      t.decimal :overs
      t.integer :maidens
      t.integer :runs
      t.integer :wickets
      t.string :best
      t.integer :five_for
      t.decimal :economy
      t.decimal :strike_rate
      t.decimal :average

      t.timestamps
    end
  end
end
