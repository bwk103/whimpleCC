require 'rails_helper'

RSpec.describe Bowling, type: :model do
  before(:example) do
    @bowl = Bowling.new(
      overs: 10.0,
      maidens: 3,
      runs: 30,
      wickets: 7,
      best: "30/5",
      five_for: 1
    )
  end

  describe('bowling stats') do
    it('are valid') do
      expect(@bowl).to be_valid
    end
  end

  describe('validators') do
    describe('overs') do
      it('cannot be negative') do
        @bowl.overs = -1
        expect(@bowl).not_to be_valid
      end
    end
    describe('maidens') do
      it('cannot be negative') do
        @bowl.maidens = -1
        expect(@bowl).not_to be_valid
      end
      it('cannot be more than overs bowled') do
        @bowl.maidens = 100
        expect(@bowl).not_to be_valid
      end
    end
    describe('runs') do
      it('cannot be negative') do
        @bowl.runs = -1
        expect(@bowl).not_to be_valid
      end
    end
    describe('wickets') do
      it('cannot be negative') do
        @bowl.wickets = -1
        expect(@bowl).not_to be_valid
      end
    end
    describe('five_for') do
      it('cannot be negative') do
        @bowl.five_for = -1
        expect(@bowl).not_to be_valid
      end
    end
  end
  describe('#economy') do
    it('returns the bowlings economy rate') do
      @bowl.set_economy
      expect(@bowl.economy).to be 3.00
    end
  end
  describe('#strike_rate') do
    it('returns the bowlers strike rate') do
      @bowl.set_strike_rate
      expect(@bowl.strike_rate).to be 8.6
    end
  end
  describe('#average') do
    it('returns the bowlers average') do
      @bowl.set_average
      expect(@bowl.average).to be 4.3
    end
  end
end
