require 'rails_helper'

RSpec.feature 'Navbar navigation', type: :feature do
  before(:each) do
    Fixture.create!(
      opponent: 'Another CC',
      location: 'Knowle Cross',
      match_start: DateTime.now,
      result: nil,
      whimple_score: nil,
      opponent_score: nil
    )
  end

  scenario 'User can see navbar' do
    visit '/'
    expect(page).to have_link('History')
    expect(page).to have_link('Players')
    expect(page).to have_link('Fixtures')
    expect(page).to have_link('Events')
  end

  scenario 'User can navigate to players' do
    visit '/'
    expect(page).to have_link('Players')
    click_link 'Players'
    expect(page.current_path).to eq players_path
    click_link 'Whimple CC'
    expect(page.current_path).to eq root_path
  end

  scenario 'User can navigate to fixtures' do
    visit '/'
    expect(page).to have_link 'Fixtures'
    click_link 'Fixtures'
    expect(page.current_path).to eq fixtures_path
  end

  scenario 'User can navigate to History' do
    visit '/'
    expect(page).to have_link 'History'
    click_link 'History'
    expect(page.current_path).to eq history_path
  end

  scenario 'User can navigate to Events' do
    visit '/'
    expect(page).to have_link 'Events'
    click_link 'Events'
    expect(page.current_path).to eq events_path
  end
end
