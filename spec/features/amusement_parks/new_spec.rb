require 'rails_helper'

RSpec.describe 'New' do
  describe 'user story 8' do
    it "should have link to Rides index " do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: true,)

      visit "/amusement_parks/new"
      page.click_link("Rides")
      expect(current_path).to eq('/rides')
    end
  end
  describe 'user story 9' do
    it "should have link to amusement parks index" do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: true,)

      visit "/amusement_parks/new"
      page.click_link("Amusement Parks")
      expect(current_path).to eq('/amusement_parks')
    end
  end
  describe 'user story 11' do
    it "can create a new record for amusement park" do
      visit "/amusement_parks/new"
      # save_and_open_page
      fill_in 'Name', with: 'Cedar Point'
      fill_in 'Cost of entry', with: '105'
      check "Check box if the park is open year round:"
      click_button("Create Amusement Park")
      expect(current_path).to eq('/amusement_parks')
      expect(page). to have_content("Cedar Point")
    end
  end
end
