require 'rails_helper'

RSpec.describe 'New' do
  describe 'user story 8' do
    it "should have link to Rides index " do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: true,)

      visit "/amusement_parks/#{amusement_park.id}/edit"
      page.click_link("Rides")
      expect(current_path).to eq('/rides')
    end
  end
  describe 'user story 9' do
    it "should have link to amusement parks index" do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: true,)

      visit "/amusement_parks/#{amusement_park.id}/edit"
      page.click_link("Amusement Parks")
      expect(current_path).to eq('/amusement_parks')
    end
  end
  #user story 12
  it "has a form to update a record on the amusement park show page" do

    amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)

    visit "/amusement_parks/#{amusement_park_2.id}"
    expect(page).to have_content(45)
    page.click_link("Edit Amusement Park")
    fill_in 'Name', with: "King's Island"
    fill_in 'cost_of_entry', with: 55
    click_button 'Update Amusement Park'
    expect(current_path). to eq("/amusement_parks/#{amusement_park_2.id}")
    expect(page).to have_content(55)
  end
end
