require 'rails_helper'

RSpec.describe PlayersHelper, type: :helper do
  describe '#full_name' do
    player = Player.create!(
      first_name: 'Test', surname: 'McTesty', email: 'test@test.com', team: 1, role: 'Batsman', bio: 'a test'
    )
    it 'returns a players first name followed by surname' do
      expect(full_name(player)).to eq 'Test McTesty'
    end
  end
end
