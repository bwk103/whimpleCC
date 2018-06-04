require 'rails_helper'

RSpec.feature 'session_management', type: :feature do

    scenario 'accessing login screen' do
      visit root_path
      click_link 'Login'
      expect(current_path).to eq login_path
    end

    scenario 'logging in' do
      visit login_path
      fill_in 'Username', :with => 'admin'
      fill_in 'Password', :with => 'test'
      click_button 'Login'
      expect(current_path).to eq root_path
      expect(page).to have_text 'Logout'
    end
    
    scenario 'logging out' do
      visit login_path
      fill_in 'Username', :with => 'admin'
      fill_in 'Password', :with => 'test'
      click_button 'Login'
      click_link 'Logout'
      expect(current_path).to eq root_path
      expect(page).to have_text 'Login'
    end
  end