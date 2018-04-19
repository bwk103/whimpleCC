require 'rails_helper'

RSpec.describe Batting, type: :model do
  before(:example) do
    @bat = Batting.new(
      games: 1,
      innings: 2,
      not_outs: 1,
      runs: 55,
      high_score: 34,
      average: 34,
      fifties: 0,
      hundreds: 0
    )
  end

  describe('batting model') do
    it('is valid') do
      expect(@bat).to be_valid
    end
  end

  describe('validators') do
    describe('games played') do
      it('games played cannot be less than 0') do
        @bat.games = -1
        expect(@bat).not_to be_valid
      end
    end

    describe('innings played') do
      it('innings cannot be less than 0') do
        @bat.innings = -1
        expect(@bat).not_to be_valid
      end
      it('innings cannot be higher than games played x 2') do
        @bat.innings = 3
        expect(@bat).not_to be_valid
      end
    end
  end
end
