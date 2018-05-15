class AddMatchStartToFixtures < ActiveRecord::Migration[5.1]
  def change
    add_column :fixtures, :match_start, :datetime
  end
end
