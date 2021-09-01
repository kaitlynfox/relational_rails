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
  describe 'user story 16' do
    it 'lists rides by amusement park in alphabetical order by name' do
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
      visit "/amusement_parks/#{amusement_park_2.id}/rides"
      click_link("Alphabetize Rides")
      # expect(current_path).to eq("/amusement_parks/#{amusement_park_2.id}/rides")

      expect(ride_2.name).to appear_before(ride.name)

    end
  end
  describe 'user story 21' do
    it 'lists only rides by amusement park that have a higher top speed than the user inputted data' do
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
      ride_4 = amusement_park.rides.create!(name: "Rock n Roller Coaster",
                                          roller_coaster: false,
                                          top_speed: 66,)
      visit "/amusement_parks/#{amusement_park_2.id}/rides"
      fill_in :top_speed, with: 65
      click_button "Submit"
      save_and_open_page
      expect(page).to have_content(ride_2.name)
      expect(page).not_to have_content(ride.name)
      expect(page).not_to have_content(ride_3.name)
      expect(page).not_to have_content(ride_4.name)

    end
  end

end
