require 'rails_helper'

RSpec.describe FixturesController, type: :controller do
  before(:example) do
    Fixture.create!(
      opponent: 'Another CC',
      location: 'Knowle Cross',
      match_start: DateTime.now,
      result: nil,
      whimple_score: nil,
      opponent_score: nil
    )
  end

  describe '#index' do
    before(:example) do
      get :index
    end

    it 'assigns all fixtures to @fixtures' do
      expect(assigns(:fixtures).length).to be 1
    end

    it 'returns 200 status code' do
      expect(response.status).to be 200
    end

    it 'renders the index view' do
      expect(response).to render_template 'index'
    end
  end

  describe '#new' do
    before(:example) do
      get :new
    end

    it 'returns 200 status code' do
      expect(response.status).to be 200
    end

    it 'renders the new view' do
      expect(response).to render_template 'new'
    end
  end
end
