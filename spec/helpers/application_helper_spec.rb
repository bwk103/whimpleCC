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

  describe "#formatted_date" do
    it "returns a formatted date when passed a datetime" do
      date = Date.new(2018, 3, 12)
      expect(helper.formatted_date(date)).to eq '12 March 2018 at 12:00'
    end
  end
end
