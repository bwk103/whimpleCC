require 'rails_helper'

RSpec.describe Event, type: :model do

  before(:example) do
    @event = Event.new(name: 'Band Night',
                      date: Date.new,
                      location: 'Knowles Cross',
                      description: 'The Annual Band Night'
                    )
  end

  describe "is valid model" do
    it "is valid" do
      expect(@event).to be_valid
    end
  end

  describe "validators" do
    it "requires a name" do
      @event.name = nil;
      expect(@event).not_to be_valid
    end

    it "requires a date" do
      @event.date = nil
      expect(@event).not_to be_valid
    end

    it "requires a location" do
      @event.location = nil
      expect(@event).not_to be_valid
    end

    it "requires a description" do
      @event.description = nil
      expect(@event).not_to be_valid
    end
  end

end
