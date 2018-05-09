require 'rails_helper'

RSpec.describe Fielding, type: :model do
  before(:example) do
    @player = Player.new(
      first_name: 'Test', surname: 'McTesty', email: 'test@test.com', team: 1, role: 'Batsman', bio: 'a test'
    )
    @field = Fielding.new(
      catches: 10,
      stumpings: 2,
      run_outs: 1
    )
    @player.fielding = @field
  end

  describe('fielding model') do
    it('is valid') do
      expect(@field).to be_valid
    end
    describe('validators') do
      describe('catches') do
        it('cannot be negative') do
          @field.catches = -1
          expect(@field).not_to be_valid
        end
      end
      describe('stumpings') do
        it('cannot be negative') do
          @field.stumpings = -1
          expect(@field).not_to be_valid
        end
      end
      describe('run_outs') do
        it('cannot be negative') do
          @field.run_outs = -1
          expect(@field).not_to be_valid
        end
      end
    end
  end
end
