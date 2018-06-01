require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  before(:example) do
    @event = Event.create!(name: 'Band Night',
                           date: Date.new(2018, 3, 12),
                           location: 'Knowle Cross',
                           description: 'Its band night!')

    @valid_event = { name: 'BBQ',
                     date: Date.new(2018, 2, 1),
                     location: 'Knowle Cross',
                     description: 'Burnt food and cold beer' }

    @invalid_event = { name: nil,
                       date: Date.new(2018, 3, 12),
                       location: 'Whimple CC',
                       description: 'Band night is back!' }
    @user = User.create!( username: 'james', password: 'test', admin: true )
  end

  describe '#index' do
    before(:example) do
      get :index
    end

    it 'assigns all events to events' do
      expect(assigns(:events).length).to eq 1
    end

    it 'returns a 200 status code' do
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      expect(response).to render_template 'index'
    end
  end

  describe '#show' do
    before(:example) do
      get :show, params: { id: @event.id.to_s }
    end

    it 'assigns the requested event to event' do
      expect(assigns(:event).name).to eq 'Band Night'
      expect(assigns(:event).date).to eq Date.new(2018, 3, 12)
      expect(assigns(:event).location).to eq 'Knowle Cross'
      expect(assigns(:event).description).to eq 'Its band night!'
    end

    it 'returns a 200 status code' do
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      expect(response).to render_template 'show'
    end
  end

  describe '#new' do
    describe 'when admin user logged in' do
      before(:example) do
        log_in_as(@user)
        get :new
      end

      it 'returns a 200 status code' do
        expect(response.status).to eq 200
      end

      it 'renders the new template' do
        expect(response).to render_template 'new'
      end
    end

    describe 'when admin user not logged in' do
      before(:example) do
        get(:new)
      end

      it 'returns a redirect status code' do
        expect(@response.status).to be 302
      end

      it 'redirects the user to the root_path' do
        expect(@response).to redirect_to root_path
      end
    end
  end

  describe '#create' do
    describe 'when admin user logged in' do
      before(:example) do
        log_in_as(@user)
      end

      describe 'with valid attributes' do
        it 'creates a new event' do
          expect do
            post :create, params: { event: @valid_event }
          end.to change(Event, :count).by(1)
        end
  
        it 'redirects to the new event page' do
          post :create, params: { event: @valid_event }
          expect(response).to redirect_to Event.last
        end
      end
  
      describe 'without valid attributes' do
        it 'does not create a new event' do
          expect do
            post :create, params: { event: @invalid_event }
          end.not_to change(Event, :count)
        end
  
        it 're-renders the new event view' do
          post :create, params: { event: @invalid_event }
          expect(response).to render_template 'new'
        end
      end
    end
  end

  describe '#edit' do
    before(:example) do
      log_in_as(@user)
      get :edit, params: { id: @event.id.to_s }
    end

    it 'assigns the requested event to event' do
      expect(assigns(:event).name).to eq 'Band Night'
    end

    it 'returns a 200 status code' do
      expect(response.status).to eq 200
    end

    it 'reders the edit template' do
      expect(response).to render_template 'edit'
    end
  end

  describe '#update' do
    describe 'when given valid attributes' do
      before(:example) do
        log_in_as(@user)
      end
      it 'updates the event' do
        patch :update, params: { id: @event.id, event: @valid_event }
        @event.reload
        expect(@event.name).to eq 'BBQ'
        expect(@event.description).to eq 'Burnt food and cold beer'
      end

      it 'redirects to the events show page' do
        patch :update, params: { id: @event.id, event: @valid_event }
        expect(response).to redirect_to @event
      end
    end

    describe 'when not given valid attributes' do
      it 'does not update the event' do
        patch :update, params: { id: @event.id, event: @invalid_event }
        @event.reload
        expect(@event.name).to eq 'Band Night'
      end
    end
  end

  describe '#destroy' do
    before(:example) do
      log_in_as(@user)
    end
    it 'deletes the event' do
      expect do
        delete :destroy, params: { id: @event.id }
      end.to change(Event, :count).by(-1)
    end
  end
end
