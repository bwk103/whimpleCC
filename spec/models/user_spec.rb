require 'rails_helper'

RSpec.describe User, type: :model do
  before(:example) do
    @user = User.new(username: 'Test', password_digest: 'test', admin: false)
  end

  describe 'valid models' do
    it 'are valid' do
      expect(@user).to be_valid
    end
  end
end
