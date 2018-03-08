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

  describe "contact" do
    before(:each) do
      get :contact
    end

    it "returns a 200 status code" do
      expect(response.status).to eq 200
    end

    it "renders the contact template" do
      expect(response).to render_template("contact")
    end
  end

  describe "history" do
    before(:each) do
      get :history
    end

    it "returns a 200 status code" do
      expect(response.status).to eq 200
    end

    it "renders the history template" do
      expect(response).to render_template("history")
    end
  end

  describe "ground" do
    before(:each) do
      get :ground
    end

    it "returns a 200 status code" do
      expect(response.status).to eq 200
    end

    it "renders the ground template" do
      expect(response).to render_template("ground")
    end
  end

  describe "ground" do
    before(:each) do
      get :sponsors
    end

    it "returns a 200 status code" do
      expect(response.status).to eq 200
    end

    it "renders the sponsors template" do
      expect(response).to render_template("sponsors")
    end
  end
end
