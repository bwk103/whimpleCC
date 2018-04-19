class CreateFieldings < ActiveRecord::Migration[5.1]
  def change
    create_table :fieldings do |t|
      t.integer :catches
      t.integer :stumpings
      t.integer :run_outs

      t.timestamps
    end
  end
end
