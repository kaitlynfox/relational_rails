require 'rails_helper'

RSpec.describe 'Rides' do
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

    save_and_open_page

    expect(page).to have_content(ride.name)
    expect(page).to have_content(ride.roller_coaster)
    expect(page).to have_content(ride.top_speed)
  end

  it "show page can see child by id with attributes" do

    amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                           cost_of_entry: 95,
                                           open_year_round: false,)

    ride = amusement_park.rides.create!(name: "The Beast",
                                        roller_coaster: true,
                                        top_speed: 55,)
    ride_2 = amusement_park.rides.create!(name: "Diamond Back",
                                        roller_coaster: true,
                                        top_speed: 100,)

    visit "/rides/#{ride.id}"

    save_and_open_page

    expect(page).to have_content(ride.name)
    expect(page).to have_content(ride.roller_coaster)
    expect(page).to have_content(ride.top_speed)
  end
  describe 'user story 8' do
    it "should have link to Rides index on all pages" do
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
      # visit "/"
      # page.has_link?(true)
      # page.click_link("Rides")
      

      visit "/amusement_parks"
      page.has_link?(true)
      page.click_link("Rides")

      visit "/amusement_parks/#{amusement_park.id}"
      page.has_link?(true)
      page.click_link("Rides")

      visit "/rides"
      page.has_link?(true)
      page.click_link("Rides")

      visit "/rides/#{ride.id}"
      page.has_link?(true)
      page.click_link("Rides")

      visit "/amusement_parks/#{amusement_park.id}/rides"
      page.has_link?(true)
      page.click_link("Rides")
    end
  end
end
