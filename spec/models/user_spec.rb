require 'rails_helper'

RSpec.describe User, type: :model do
  before(:example) do
    @user = User.new(username: 'Test', password_digest: 'test', admin: false)
    User.create!(username: 'Bob', password: 'test', admin: false)
  end

  describe 'valid models' do
    it 'are valid' do
      expect(@user).to be_valid
    end
  end

  describe 'validators' do
    it 'usernames cannot be blank' do
      @user.username = nil
      expect(@user).not_to be_valid
    end
    it 'usernames must be unique' do
      @user.username = 'Bob'
      expect(@user).not_to be_valid
    end
  end
end
