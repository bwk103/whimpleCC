require 'rails_helper'

RSpec.feature 'Site layout', type: :feature do
  
  scenario 'home screen' do
    visit '/'
    expect(page).to have_content 'Whimple'
    expect(page).to have_content 'Cricket Club'
  end
end
