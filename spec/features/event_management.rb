require 'rails_helper'

RSpec.feature 'event management', type: :feature do
  before(:each) do
    User.create!(
      username: 'admin1',
      password: 'test',
      admin: true
    )
    @event = Event.create!(
      name: 'Racing Night',
      location: 'Knowle Cross',
      date: Date.new,
      description: 'A test',
      ticketed: false
    )
  end

  scenario 'viewing events' do
    visit events_path
    click_link 'More Info'
    expect(current_path).to eq event_path(@event)  
    expect(page).to have_text 'Racing Night' 
  end

  scenario 'successfully adding new event' do
    visit login_path
    fill_in 'Username', :with => 'admin1'
    fill_in 'Password', :with => 'test'
    click_button 'Login'
    visit events_path
    click_link 'Add New Event'
    fill_in 'Name', :with => 'Band Night'
    fill_in 'Location', :with => 'Knowle Cross'
    select '1', :from => 'event_date_3i'
    select 'July', :from => 'event_date_2i'
    select '2018', :from => 'event_date_1i'
    check('event_ticketed')
    fill_in 'Description', :with => 'This is a test'
    click_button 'New Event'
    visit events_path
    expect(page).to have_text 'Band Night'
  end
  
  scenario 'unsuccessfully adding new event' do
    visit login_path
    fill_in 'Username', :with => 'admin1'
    fill_in 'Password', :with => 'test'
    click_button 'Login'
    visit new_event_path
    fill_in 'Name', :with => ''
    fill_in 'Location', :with => 'Knowle Cross'
    select '1', :from => 'event_date_3i'
    select 'July', :from => 'event_date_2i'
    select '2018', :from => 'event_date_1i'
    check('event_ticketed')
    fill_in 'Description', :with => 'This is a test'
    click_button 'New Event'
    expect(page).to have_text "Name can't be blank"
  end

  scenario 'successfully editing events' do
    visit login_path
    fill_in 'Username', :with => 'admin1'
    fill_in 'Password', :with => 'test'
    click_button 'Login'
    visit edit_event_path(@event)
    fill_in 'Name', :with => 'Horse Racing Night'
    click_button 'Edit Event'
    expect(current_path).to eq event_path(@event)
    expect(page).to have_text 'Horse Racing Night'
  end

  scenario 'unsuccessfully editing events' do
    visit login_path
    fill_in 'Username', :with => 'admin1'
    fill_in 'Password', :with => 'test'
    click_button 'Login'
    visit edit_event_path(@event)
    fill_in 'Name', :with => ''
    click_button 'Edit Event'
    expect(page).to have_text "Name can't be blank"
  end
end