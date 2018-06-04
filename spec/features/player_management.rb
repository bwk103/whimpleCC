require 'rails_helper'

RSpec.feature 'player management', type: :feature do
  before(:each) do
    User.create!(
      username: 'steve',
      password: 'test',
      admin: true
    )
    @player = Player.create!(
      first_name: 'Adam',
      surname: 'Shaw',
      email: 'adam@test.com',
      role: 'Batsman',
      team: '1',
      bio: nil
    )
  end

  scenario 'viewing a player' do
    visit players_url
    expect(page).to have_text 'Adam Shaw'
    click_link 'Adam Shaw'
    expect(current_path).to eq player_path(@player)
    expect(page).to have_text 'Adam Shaw'
  end

  scenario 'successfully adding a new player' do
    visit new_player_url
    expect(page).to have_text 'Add Player'
    fill_in 'First name', :with => 'James'
    fill_in 'Last name', :with => 'Seacrest'
    fill_in 'Email address', :with => 'testing@test.com'
    select 'Batsman', :from => 'Team role'
    fill_in 'Team number', :with => '1'
    click_button 'Add Player'
    visit players_url
    expect(page).to have_text 'James Seacrest'
  end

  scenario 'unsuccessfully adding a new player' do
    visit new_player_path
    fill_in 'Last name', :with => 'Seacrest'
    fill_in 'Email address', :with => 'testing@test.com'
    select 'Batsman', :from => 'Team role'
    fill_in 'Team number', :with => '1'
    click_button 'Add Player'
    expect(page).to have_text "First name can't be blank"
  end

  scenario 'deleting a player' do
    visit players_url
    expect(page).to have_text 'Adam Shaw'
    click_link 'Adam Shaw'
    expect(current_path).to eq player_path(@player)
    expect(page).to have_text 'Adam Shaw'
    click_link 'Delete Player'
    expect(current_path).to eq players_path
    expect(page).not_to have_text 'Adam Shaw'
  end

  scenario 'successfully editing a player' do
    visit players_url
    expect(page).to have_text 'Adam Shaw'
    click_link 'Adam Shaw'
    click_link 'Edit Player'
    expect(current_path).to eq edit_player_path(@player)
    fill_in 'First name', :with => 'James'
    click_button 'Edit Player'
    expect(current_path).to eq player_path(@player)
    expect(page).to have_text 'James Shaw'
  end

  scenario 'unsuccessfully editing a player' do
    visit edit_player_path(@player)
    fill_in 'First name', :with => ''
    click_button 'Edit Player'
    expect(page).to have_text "First name can't be blank" 
  end
end