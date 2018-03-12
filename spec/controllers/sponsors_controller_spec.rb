require 'rails_helper'

RSpec.describe SponsorsController, type: :controller do

  before(:example) do
    @sponsor = Sponsor.create!(name:'Whiteways', website: 'www.whiteways.com')
    @valid_sponsor = { name: 'Pub', website: 'www.pub.com' }
    @invalid_sponsor = { name: nil, website: 'www.something.com' }
  end

  describe "#index" do
    before(:example) do
      get :index
    end

    it "assigns all sponsors to @sponsors" do
      expect(assigns(:sponsors).length).to eq Sponsor.count
    end

    it "returns a 200 status code" do
      expect(response.status).to eq 200
    end

    it "renders the index template" do
      expect(response).to render_template 'index'
    end
  end

  describe "#show" do
    before(:example) do
      get :show, :params => { :id => @sponsor.id.to_s }
    end

    it "assigns the requested sponsor to @sponsor" do
      expect(assigns(:sponsor).name).to eq 'Whiteways'
    end

    it "returns a 200 status code" do
      expect(response.status).to eq 200
    end

    it "renders the show template" do
      expect(response).to render_template 'show'
    end
  end

  describe "#new" do
    before(:example) do
      get :new
    end
    it "returns a 200 status code" do
      expect(response.status).to eq 200
    end

    it "renders the new template" do
      expect(response).to render_template 'new'
    end
  end

  describe "#create" do
    describe "when valid attributes" do
      it "adds a new sponsor to the database" do
        expect {
          post :create, :params => { :sponsor => @valid_sponsor }
        }.to change(Sponsor, :count).by(1)
      end

      it "redirect to the new sponsor's page" do
        post :create, :params => { :sponsor => @valid_sponsor }
        expect(response).to redirect_to Sponsor.last
      end
    end

    describe "when invalid attributes" do
      it "does not add a new sponsor to the database" do
        expect {
          post :create, :params => { :sponsor => @invalid_sponsor }
        }.not_to change(Sponsor, :count)
      end

      it "redirects to the sponsor index" do
        post :create, :params => { :sponsor => @invalid_sponsor }
        expect(response).to redirect_to sponsors_url
      end
    end
  end
end
