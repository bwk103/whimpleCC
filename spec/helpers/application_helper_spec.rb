require "rails_helper"

RSpec.describe ApplicationHelper, :type => :helper do
  describe "#full_title" do
    it "returns the default title when nothing passed in" do
      expect(helper.full_title).to eq 'Whimple CC'
    end
    it "returns a more details title when page name passed in" do
      expect(helper.full_title('Contact')).to eq 'Contact | Whimple CC'
    end
  end
end
