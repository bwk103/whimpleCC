require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  before(:example) do

    @player = Player.create!(
      first_name: 'Henry',
      surname: 'Bowler',
      email: 'henry@test.com',
      team: 1
    )

    @valid_player = {
      first_name: 'James',
      surname: 'Adams',
      email: 'james@test.com',
      team: 1
    }

    @invalid_player = {
      first_name: nil,
      surname: nil,
      email: 'james@test.com',
      team: 1
    }
  end

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

  describe "#new" do
    before(:example) do
      get :new
    end

    it "returns a status code of 200" do
      expect(response.status).to eq 200
    end

    it "renders the new template" do
      expect(response).to render_template 'new'
    end
  end

  describe '#create' do
    describe "when given valid attributes" do
      it "creates a new player" do
        expect {
          post :create, :params => { :player => @valid_player }
        }.to change(Player, :count).by(1)
      end

      it "redirects to the new players profile" do
        post :create, :params => { :player => @valid_player }
        expect(response).to redirect_to Player.last
      end
    end

    describe "when given invalid attributes" do
      it "does not create a new player" do
        expect {
          post :create, :params => { :player => @invalid_player }
        }.not_to change(Player, :count)
      end

      it "redirects the user back to the new player form" do
        post :create, :params => { :player => @invalid_player }
        expect(response).to redirect_to new_player_path
      end
    end
  end
  describe "#show" do
    before(:example) do
      get :show, :params => { :id => @player.id.to_s}
    end

    it "assigns the requested player" do
      expect(assigns(:player).first_name).to eq 'Henry'
      expect(assigns(:player).surname).to eq 'Bowler'
      expect(assigns(:player).email).to eq 'henry@test.com'
      expect(assigns(:player).team).to eq 1
    end

    it "returns status code 200" do
      expect(response.status).to eq 200
    end

    it "renders the show template" do
      expect(response).to render_template 'show'
    end
  end
end
