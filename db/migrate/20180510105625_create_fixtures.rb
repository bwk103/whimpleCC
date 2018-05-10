class CreateFixtures < ActiveRecord::Migration[5.1]
  def change
    create_table :fixtures do |t|
      t.string :opponent
      t.string :location
      t.date :date
      t.time :time
      t.string :result
      t.string :whimple_score
      t.string :opponent_score

      t.timestamps
    end
  end
end
