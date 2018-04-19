require 'rails_helper'

RSpec.describe Batting, type: :model do
  before(:example) do
    @player = Player.new(
      first_name: 'Test',
      surname: 'Player',
      email: 'test@email.com',
      team: 1
    )
    @bat = Batting.new(
      games: 1,
      innings: 2,
      not_outs: 1,
      runs: 55,
      high_score: 34,
      average: 55,
      fifties: 0,
      hundreds: 0
    )
    @player.batting = @bat
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

    describe('not_outs') do
      it('cannot be less than 0') do
        @bat.not_outs = -1
        expect(@bat).not_to be_valid
      end
      it('cannot be more than games played x 2') do
        @bat.not_outs = 3
        expect(@bat).not_to be_valid
      end
    end

    describe('runs') do
      it('cannot be negative') do
        @bat.runs = -1
        expect(@bat).not_to be_valid
      end
    end

    describe('high score') do
      it('cannot be negative') do
        @bat.high_score = -1
        expect(@bat).not_to be_valid
      end
      it('cannot be higher than total runs scored') do
        @bat.high_score = 100
        @bat.set_average
        expect(@bat).not_to be_valid
      end
    end

    describe('average') do
      it('cannot be negative') do
        @bat.average = -1
        expect(@bat).not_to be_valid
      end
    end

    describe('fifties') do
      it('cannot be negative') do
        @bat.fifties = -1
        expect(@bat).not_to be_valid
      end
    end

    describe('hundreds') do
      it('cannot be negative') do
        @bat.hundreds = -1
        expect(@bat).not_to be_valid
      end
    end
  end

  describe('#set_average') do
    it('sets the batsman\'s average score') do
      expect(@bat.average).to be 55
      @bat.runs = 100
      @bat.not_outs = 0
      @bat.set_average
      expect(@bat.average).to be 50
    end

    it('catches the situation where batsman has never been out') do
      @bat.not_outs = 2
      @bat.set_average
      expect(@bat.average).to be_nil
    end
  end
end
