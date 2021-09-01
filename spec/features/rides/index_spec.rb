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
      expect(page).to have_content(ride.id)
      expect(page).to have_content(ride.created_at)
      expect(page).to have_content(ride.updated_at)
      expect(page).to have_content(ride_2.name)
      expect(page).to have_content(ride_2.roller_coaster)
      expect(page).to have_content(ride_2.top_speed)
      expect(page).to have_content(ride_2.id)
      expect(page).to have_content(ride_2.created_at)
      expect(page).to have_content(ride_2.updated_at)
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
      page.click_link("Amusement Parks")
      expect(current_path).to eq('/amusement_parks')
    end
  end
  describe 'user story 15' do
    it 'only shows rides that are roller coasters (true)' do
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
      visit "/rides"
      expect(page).to have_content("#{ride.name}")
      expect(page).to have_content("#{ride_2.name}")
      expect(page).not_to have_content("#{ride_3.name}")
    end
  end
  describe 'user story 18' do
    it "should have link to edit each amusement park record next to the record" do
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
      visit "/rides"
      save_and_open_page
      page.has_link?("Edit The Beast")
      page.has_link?("Edit Diamond Back")
      click_link("Edit Diamond Back")
      expect(current_path).to eq("/rides/#{ride_2.id}/edit")
    end
  end
  describe 'user story 18' do
    it "should have link to delete ride next to each record" do
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
      visit "/rides"
      save_and_open_page
      page.has_link?("Delete The Beast")
      page.has_link?("Delete Diamond Back")
      click_link("Delete Diamond Back")
      expect(current_path).to eq("/rides")
      expect(page).not_to have_content("#{ride_2.name}")

    end
  end
end
