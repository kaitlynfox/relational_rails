require 'rails_helper'

RSpec.describe 'New page' do
  describe 'user story 8' do
    it "should have link to Rides index " do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: true,)

      visit "/amusement_parks/#{amusement_park.id}/rides/new"
      page.click_link("Rides")
      expect(current_path).to eq('/rides')
    end
  end
  describe 'user story 9' do
    it "should have link to amusement parks index" do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: true,)

      visit "/amusement_parks/#{amusement_park.id}/rides/new"
      page.click_link("Amusement Parks")
      expect(current_path).to eq('/amusement_parks')
    end
  end
  describe "user story 13" do
    it "can create a new record for ride by amusement park" do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: true,)

      visit "/amusement_parks/#{amusement_park.id}/rides/new"

      fill_in 'Name', with: "Rock 'n' Roller Coaster"
      fill_in 'Top speed', with: '57'
      check "Check box if the ride is a roller coaster:"
      click_button("Create Ride")
      expect(current_path).to eq("/amusement_parks/#{amusement_park.id}/rides")
      expect(page). to have_content("Rock 'n' Roller Coaster")
    end
  end
end
