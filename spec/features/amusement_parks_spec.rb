require 'rails_helper'

RSpec.describe 'the amusement parks index page' do
  it "can see all amusement park names" do

    amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                           cost_of_entry: 95,
                                           open_year_round: false,)

    visit '/amusement_parks'

    expect(page).to have_content(amusement_park.name)
  end


  it "can see all amusement park names and its attributes" do
    amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                           cost_of_entry: 95,
                                           open_year_round: false,)

    visit "/amusement_park/#{amusement_park.id}"

    expect(page).to have_content(amusement_park.name)
    expect(page).to have_content(amusement_park.cost_of_entry)
    expect(page).to have_content(amusement_park.open_year_round)
  end
end
