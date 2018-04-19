class AddPlayerToBatting < ActiveRecord::Migration[5.1]
  def change
    add_reference :battings, :player, foreign_key: true
  end
end
