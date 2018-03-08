require 'rails_helper'

RSpec.feature "Navbar navigation", :type => :feature do
  scenario "User can see navbar" do
    visit '/'
    expect(page).to have_link("Club")
    expect(page).to have_link("Squads")
    expect(page).to have_link("Fixtures")
    expect(page).to have_link("Events")
    expect(page).to have_link("More")
  end

end
