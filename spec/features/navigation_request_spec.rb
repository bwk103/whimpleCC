require 'rails_helper'

RSpec.feature 'Navbar navigation', type: :feature do
  scenario 'User can see navbar' do
    visit '/'
    expect(page).to have_link('Players')
    expect(page).to have_link('Fixtures')
    expect(page).to have_link('Events')
    expect(page).to have_link('More')
  end

  scenario 'User can navigate to /players' do
    visit '/'
    expect(page).to have_link('Players')
    click_link 'Players'
    expect(page.current_path).to eq players_path
    click_link 'Whimple CC'
    expect(page.current_path).to eq root_path
  end
end
