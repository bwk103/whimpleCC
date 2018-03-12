require 'rails_helper'

RSpec.describe Sponsor, type: :model do

  before(:example) do
    @sponsor = Sponsor.new(name: 'Pub', website: 'www.pub.com',
                          email: 'pub@test.com', phone: '020 345 3321',
                          address: '23 Exeter Road, Whimple')
  end

  describe "valid sponsors" do
    it "can be valid" do
      expect(@sponsor).to be_valid
    end
  end

  describe "require" do
    it "a name that is not nil" do
      @sponsor.name = nil
      expect(@sponsor).not_to be_valid
    end
  end
end
