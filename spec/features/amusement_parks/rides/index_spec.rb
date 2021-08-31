require 'rails_helper'

RSpec.describe 'index page' do
  it "can show each ride that is assoicated with the park and it's attribues" do
    amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                           cost_of_entry: 95,
                                           open_year_round: true,)
    amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)

    ride = amusement_park_2.rides.create!(name: "The Beast",
                                        roller_coaster: true,
                                        top_speed: 55,)
    ride_2 = amusement_park_2.rides.create!(name: "Diamond Back",
                                        roller_coaster: true,
                                        top_speed: 100,)
    ride_3 = amusement_park.rides.create!(name: "Dumbo",
                                        roller_coaster: false,
                                        top_speed: 15,)
    visit "/amusement_parks/#{amusement_park.id}/rides"


    expect(page).to have_content(amusement_park.name)
    expect(page).to have_content(ride_3.name)
    expect(page).to have_content(ride_3.roller_coaster)
    expect(page).to have_content(ride_3.top_speed)
  end
  describe 'user story 8' do
    it "should have link to Rides index on all pages" do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: true,)

      visit "/amusement_parks/#{amusement_park.id}/rides"
      page.click_link("Rides")
      expect(current_path).to eq('/rides')
    end
  end
  describe 'user story 9' do
    it "should have link to Rides index" do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: true,)

      visit "/amusement_parks/#{amusement_park.id}/rides"
      page.has_link?(true)
      page.click_link("Amusement Parks")
      expect(current_path).to eq('/amusement_parks')
    end
  end
  describe 'user story 13' do
    it "parent child index page should have link to create new ride record" do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: true,)
    
      visit "/amusement_parks/#{amusement_park.id}/rides"
      page.has_link?(true)
      page.click_link("Add New Ride")
      expect(current_path).to eq("/amusement_parks/#{amusement_park.id}/rides/new")
    end
  end
end
