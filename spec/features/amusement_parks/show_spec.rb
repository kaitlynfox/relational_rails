require 'rails_helper'

RSpec.describe 'Show page' do
  it "can see amusement park name and its attributes by id" do
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
    visit "/amusement_parks/#{amusement_park.id}"

    # save_and_open_page

    expect(page).to have_content(amusement_park.name)
    expect(page).to have_content(amusement_park.cost_of_entry)
    expect(page).to have_content(amusement_park.open_year_round)
    expect(page).to have_content(amusement_park.rides.count)
  end
  describe 'user story 8' do
    it "should have link to Rides index" do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: true,)

      visit "/amusement_parks/#{amusement_park.id}"
      page.click_link("Rides")
      expect(current_path).to eq('/rides')
    end
  end
  describe 'user story 9' do
    it "should have link to Rides index" do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: true,)

      visit "/amusement_parks/#{amusement_park.id}"
      page.has_link?(true)
      page.click_link("Amusement Parks")
      expect(current_path).to eq('/amusement_parks')
    end
  end
  describe 'user story 10' do
    it "should have link to Rides by amusement park " do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: true,)

      visit "/amusement_parks/#{amusement_park.id}"
      page.has_link?(true)
      page.click_link("Rides by Amusement Park")
      expect(current_path).to eq("/amusement_parks/#{amusement_park.id}/rides")
    end
  end
  describe 'user story 12' do
    it "has a link to update a record" do
      amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)


      visit "/amusement_parks/#{amusement_park_2.id}"

      page.click_link("Edit Amusement Park")
      expect(current_path).to eq("/amusement_parks/#{amusement_park_2.id}/edit")
    end
  end
end
