require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "#index" do

    before(:example) do
      event = Event.create!(name: 'Band Night',
                            date: Date.new(2018, 3, 12),
                            location: 'Knowle Cross',
                            description: 'Its band night!')
      get :index
    end

    it "assigns all events to events" do
      expect(assigns(:events).length).to eq 1
    end

    it "returns a 200 status code" do
      expect(response.status).to eq 200
    end

    it "renders the index template" do
      expect(response).to render_template 'index'
    end
  end

  describe '#show' do

    before(:example) do
      event = Event.create!(name: 'Band Night',
                            date: Date.new(2018, 3, 12),
                            location: 'Knowle Cross',
                            description: 'Its band night!')
      get :show, :params => { :id => event.id.to_s}
    end

    it "assigns the requested event to event" do
      expect(assigns(:event).name).to eq 'Band Night'
      expect(assigns(:event).date).to eq Date.new(2018, 3, 12)
      expect(assigns(:event).location).to eq 'Knowle Cross'
      expect(assigns(:event).description).to eq 'Its band night!'
    end

    it "returns a 200 status code" do
      expect(response.status).to eq 200
    end

    it "renders the show template" do
      expect(response).to render_template 'show'
    end
  end

  describe '#new' do
    before(:example) do
      get :new
    end

    it 'returns a 200 status code' do
      expect(response.status).to eq 200
    end

    it "renders the new template" do
      expect(response).to render_template 'new'
    end
  end

  describe '#create' do
    describe "with valid attributeds" do
      event = { :name => 'BBQ',
                :date => Date.new(2018, 2, 1),
                :location => 'Knowle Cross',
                :description => 'Burnt food and cold beer' }
      it "creates a new event" do
        expect {
          post :create, :params => { :event => event }
        }.to change(Event, :count).by(1)
      end

      it "redirects to the new event page" do
        post :create, :params => { :event => event }
        expect(response).to redirect_to Event.last
      end
    end

    describe 'without valid attributes' do
      event = { :name => nil,
                :date => Date.new(2018, 2, 1),
                :location => 'Knowle Cross',
                :description => 'Burnt food and cold beer' }

      it "does not create a new event" do
        expect {
          post :create, :params => { :event => event }
        }.not_to change(Event, :count)
      end

      it "redirects to the new event form" do
        post :create, :params => { :event => event }
        expect(response).to redirect_to new_event_path
      end
    end
  end
end
