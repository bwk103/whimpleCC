class AddPlayerToFieldings < ActiveRecord::Migration[5.1]
  def change
    add_reference :fieldings, :player, foreign_key: true
  end
end
