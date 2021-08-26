require 'rails_helper'

RSpec.describe 'the rides index page' do
  it "can see the rides name and attributes" do

    amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                           cost_of_entry: 95,
                                           open_year_round: false,)

    ride = amusement_park.rides.create!(name: "The Beast",
                                        roller_coaster: true,
                                        top_speed: 100,)

    visit "/rides"

    save_and_open_page

    expect(page).to have_content(ride.name)
    expect(page).to have_content(ride.roller_coaster)
    expect(page).to have_content(ride.top_speed)
  end
end