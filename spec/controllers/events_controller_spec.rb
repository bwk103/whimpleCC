require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  before(:example) do
    get :index
  end

  describe "#index" do
    it "returns a 200 status code" do
      expect(response.status).to eq 200
    end

    it "renders the index template" do
      expect(response).to render_template 'index'
    end
  end
end
