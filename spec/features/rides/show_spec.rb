require 'rails_helper'

RSpec.describe 'index page' do
  describe 'user story 4' do
    it "can see ride by id with attributes" do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: false,)

      ride = amusement_park.rides.create!(name: "The Beast",
                                          roller_coaster: true,
                                          top_speed: 55,)
      visit "/rides/#{ride.id}"

      expect(page).to have_content(ride.name)
      expect(page).to have_content(ride.roller_coaster)
      expect(page).to have_content(ride.top_speed)

    end
  end
  describe 'user story 8' do
    it "should have link to Rides index on all pages" do
      amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)

      ride = amusement_park_2.rides.create!(name: "The Beast",
                                          roller_coaster: true,
                                          top_speed: 55,)


      visit "/rides/#{ride.id}"
      page.click_link("Rides")
      expect(current_path).to eq('/rides')
    end
  end
  describe 'user story 9' do
    it "should have link to Rides index" do
      amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)
      ride = amusement_park_2.rides.create!(name: "The Beast",
                                          roller_coaster: true,
                                          top_speed: 55,)

      visit "/rides/#{ride.id}"
      page.has_link?(true)
      page.click_link("Amusement Parks")
      expect(current_path).to eq('/amusement_parks')
    end
  end
  describe 'user story 14' do
    it "has a link to update a record" do
      amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)

      ride = amusement_park_2.rides.create!(name: "The Beast",
                                          roller_coaster: true,
                                          top_speed: 55,)

      visit "/rides/#{ride.id}"
      page.click_link("Edit Ride")
      expect(current_path).to eq("/rides/#{ride.id}/edit")
    end
  end
  describe 'user story 20' do
    it "has a link to delete a ride record" do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                            cost_of_entry: 95,
                                            open_year_round: true,)
      ride_2 = amusement_park.rides.create!(name: "Crazy Cool Ride", roller_coaster: true, top_speed: 70)
      ride_3 = amusement_park.rides.create!(name: "Dumbo",
                                          roller_coaster: true,
                                          top_speed: 15,)
      visit "/rides/#{ride_2.id}"

      page.click_link("Delete Ride")
      expect(current_path).to eq("/rides")
      expect(page).not_to have_content(ride_2.name)
    end
  end
end
