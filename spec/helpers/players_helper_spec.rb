require 'rails_helper'

RSpec.describe PlayersHelper, type: :helper do
  describe "#full_name" do
    player = Player.create!(
      first_name: 'Bob',
      surname: 'Smith',
      email: 'bob@test.com',
      team: 1
    )
    it "returns a players first name followed by surname" do
      expect(full_name(player)).to eq 'Bob Smith'
    end
  end
end
