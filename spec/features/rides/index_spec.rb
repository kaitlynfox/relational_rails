require 'rails_helper'

RSpec.describe 'index page' do
  describe 'user story 3' do
    it "index page can see the rides name and attributes" do

      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: false,)

      ride = amusement_park.rides.create!(name: "The Beast",
                                          roller_coaster: true,
                                          top_speed: 55,)
      ride_2 = amusement_park.rides.create!(name: "Diamond Back",
                                          roller_coaster: true,
                                          top_speed: 100,)

      visit "/rides"

      expect(page).to have_content(ride.name)
      expect(page).to have_content(ride.roller_coaster)
      expect(page).to have_content(ride.top_speed)
      expect(page).to have_content(ride_2.name)
      expect(page).to have_content(ride_2.roller_coaster)
      expect(page).to have_content(ride_2.top_speed)
    end
  end
  describe 'user story 8' do
    it "should have link to Rides index on all pages" do

      visit "/rides"
      page.click_link("Rides")
      expect(current_path).to eq('/rides')
    end
  end
  describe 'user story 9' do
    it "should have link to amusement parks index" do

      visit "/rides"
      page.has_link?(true)
      page.click_link("Amusement Parks")
      expect(current_path).to eq('/amusement_parks')
    end
  end
end
