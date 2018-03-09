require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  describe "#index" do
    it "returns a status code of 200" do
      get :index
      expect(response.status).to eq 200
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
