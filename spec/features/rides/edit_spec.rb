require 'rails_helper'

RSpec.describe 'edit page' do
  describe 'user story 14' do
    it "has a form to update a record" do
      amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)

      ride = amusement_park_2.rides.create!(name: "The Beast",
                                          roller_coaster: true,
                                          top_speed: 55,)
      visit "/rides/#{ride.id}"
      expect(page).to have_content(55)
      page.click_link("Edit Ride")
      fill_in 'Name', with: "The Beast"
      fill_in 'Top speed', with: 65
      click_button 'Update Ride'
      expect(current_path). to eq("/rides/#{ride.id}")
      save_and_open_page
      expect(page).to have_content(65)
    end
  end
end
