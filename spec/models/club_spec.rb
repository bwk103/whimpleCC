require 'rails_helper'

RSpec.describe Club, type: :model do
  before(:each) do
    @club = Club.new(name: "Cricket Club", ground: "Cricket Ground")
  end

  describe 'basics' do
    it 'is valid' do
      expect(@club).to be_valid
    end
  end
  describe 'validators' do
    describe 'name' do
      it 'must not be nil' do
        @club.name = nil
        expect(@club).not_to be_valid
      end
      it 'must be at least three characters long' do
        @club.name = 'ab'
        expect(@club).not_to be_valid
      end
      it 'must be no longer than 50 characters long' do
        @club.name = 'a' * 51
        expect(@club).not_to be_valid
      end
    end
  end
end
