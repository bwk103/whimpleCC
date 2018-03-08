require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "home" do

    before(:each) do
      get :home
    end

    it "returns a 200 status code" do
        expect(response.status).to eq(200)
    end

    it "renders the home template" do
      expect(response).to render_template("home")
    end
  end
end
