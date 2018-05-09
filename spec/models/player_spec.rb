require 'rails_helper'

RSpec.describe Player, type: :model do
  before(:example) do
    @player = Player.new(
      first_name: 'Test', surname: 'McTesty', email: 'test@test.com', team: 1, role: 'Batsman', bio: 'a test'
    )
  end

  describe 'adding valid players' do
    it 'accepts a valid model' do
      expect(@player).to be_valid
    end
  end

  describe 'adding invalid players' do
    it 'players must have a first name' do
      @player.first_name = nil
      expect(@player).not_to be_valid
    end

    it 'players must have a surname' do
      @player.surname = nil
      expect(@player).not_to be_valid
    end

    it 'players must have an email address' do
      @player.email = nil
      expect(@player).not_to be_valid
    end

    it 'checks user enters valid email' do
      @player.email = 'hello'
      expect(@player).not_to be_valid
      @player.email = 'bob@bob'
      expect(@player).not_to be_valid
      @player.email = 'bob@test.com'
      expect(@player).to be_valid
    end
  end

  it 'players must belong to a team' do
    @player.team = nil
    expect(@player).not_to be_valid
  end

  it 'team must be between 0 and 2' do
    @player.team = 5
    expect(@player).not_to be_valid
    @player.team = -1
    expect(@player).not_to be_valid
    @player.team = 1
    expect(@player).to be_valid
  end

  it 'players must have a role' do
    @player.role = nil
    expect(@player).not_to be_valid
  end

  it 'players can be a Batsman' do
    @player.role = 'Batsman'
    expect(@player).to be_valid
  end

  it 'players can be a Bowler' do
    @player.role = 'Bowler'
    expect(@player).to be_valid
  end

  it 'players can be a Wicketkeeper' do
    @player.role = 'Wicketkeeper'
    expect(@player).to be_valid
  end

  it 'players can be an All-Rounder' do
    @player.role = 'All-Rounder'
    expect(@player).to be_valid
  end

  it 'players cannot be any other role' do
    @player.role = 'Specialist Fielder'
    expect(@player).not_to be_valid
  end
end
