class AddBowlingsToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_reference :bowlings, :player, foreign_key: true
  end
end
