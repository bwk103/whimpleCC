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
end
