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
end
