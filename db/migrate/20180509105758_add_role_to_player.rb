class AddRoleToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :role, :string
    add_column :players, :bio, :string
  end
end
