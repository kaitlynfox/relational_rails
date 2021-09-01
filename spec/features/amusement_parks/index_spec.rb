require 'rails_helper'

RSpec.describe 'Index' do
  describe 'user story 1 and 6' do
    it "can see all amusement park names" do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: false,)
      amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)

      visit '/amusement_parks'

      save_and_open_page

      expect("King's Island").to appear_before("Walt Disney World", only_text: true)
      expect(page).to have_content(amusement_park.name)
      expect(page).to have_content(amusement_park.created_at)
      expect(page).to have_content(amusement_park_2.name)
      expect(page).to have_content(amusement_park_2.created_at)

    end
  end
  describe 'user story 8' do
    it "should have link to Rides index" do
      visit "/amusement_parks"
      page.click_link("Rides")
      expect(current_path).to eq('/rides')
    end
  end
  describe 'user story 9' do
    it "should have link to Rides index" do

      visit "/amusement_parks"
      page.click_link("Amusement Parks")
      expect(current_path).to eq('/amusement_parks')
    end
  end
  describe 'user story 11' do
    it "should have link to create new amusement park record" do
      visit "/amusement_parks"
      page.click_link("New Amusement Park")
      expect(current_path).to eq("/amusement_parks/new")
    end
  end
  describe 'user story 17' do
    it "should have link to edit each amusement park record next to the record" do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: false,)
      amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)
      visit "/amusement_parks"
      page.has_link?("Edit Walt Disney World")
      page.has_link?("Edit King's Island")
      click_link("Edit King's Island")
      save_and_open_page
      expect(current_path).to eq("/amusement_parks/#{amusement_park_2.id}/edit")
    end
  end

  describe 'user story 22' do
    it "should have link to delete each amusement park record next to the record" do
      amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                             cost_of_entry: 95,
                                             open_year_round: false,)
      amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)
      visit "/amusement_parks"
      save_and_open_page
      page.has_link?("Delete Walt Disney World")
      page.has_link?("Delete King's Island")
      click_link("Delete King's Island")
      expect(current_path).to eq("/amusement_parks")
      expect(page).not_to have_content("King's Island")
    end
  end
end
