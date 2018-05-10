require 'rails_helper'

RSpec.describe Fixture, type: :model do
  before(:each) do
    @fixture = Fixture.new(
      opponent: 'Other CC',
      location: 'Knowles Cross',
      date: Date.new,
      time: Time.new,
      result: nil,
      whimple_score: nil,
      opponent_score: nil
    )
  end

  it 'can be valid' do
    expect(@fixture).to be_valid
  end

  describe 'must have' do
    it 'an opponent' do
      @fixture.opponent = nil
      expect(@fixture).not_to be_valid
    end

    it 'a location' do
      @fixture.location = nil
      expect(@fixture).not_to be_valid
    end

    it 'a date' do
      @fixture.date = nil
      expect(@fixture).not_to be_valid
    end

    it 'a time' do
      @fixture.time = nil
      expect(@fixture).not_to be_valid
    end
  end
end
