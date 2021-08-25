require 'rails_helper'

RSpec.describe 'the amusement parks index page', type: :feature do
  it "can see all amusement park names" do

    amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                           cost_of_entry: 95,
                                           open_year_round: false,)

    visit '/amusement_parks'

    expect(page).to have_content(amusement_park.name)
  end
end
