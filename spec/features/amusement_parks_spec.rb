# require 'rails_helper'
#
# RSpec.describe 'AmusmentPark' do
  # it "can see all amusement park names" do
  #
  #   amusement_park = AmusementPark.create!(name: "Walt Disney World",
  #                                          cost_of_entry: 95,
  #                                          open_year_round: false,)
  #   amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)
  #
  #   visit '/amusement_parks'
  #
  #   save_and_open_page
  #
  #   expect("King's Island").to appear_before("Walt Disney World", only_text: true)
  #   expect(page).to have_content(amusement_park.name)
  #   expect(page).to have_content(amusement_park.created_at)
  #   expect(page).to have_content(amusement_park_2.name)
  #   expect(page).to have_content(amusement_park_2.created_at)
  # end


  # it "can see amusement park name and its attributes by id" do
  #   amusement_park = AmusementPark.create!(name: "Walt Disney World",
  #                                          cost_of_entry: 95,
  #                                          open_year_round: true,)
  #   amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)
  #
  #   ride = amusement_park_2.rides.create!(name: "The Beast",
  #                                       roller_coaster: true,
  #                                       top_speed: 55,)
  #   ride_2 = amusement_park_2.rides.create!(name: "Diamond Back",
  #                                       roller_coaster: true,
  #                                       top_speed: 100,)
  #   ride_3 = amusement_park.rides.create!(name: "Dumbo",
  #                                       roller_coaster: false,
  #                                       top_speed: 15,)
  #   visit "/amusement_parks/#{amusement_park.id}"
  #
  #   save_and_open_page
  #
  #   expect(page).to have_content(amusement_park.name)
  #   expect(page).to have_content(amusement_park.cost_of_entry)
  #   expect(page).to have_content(amusement_park.open_year_round)
  #   expect(page).to have_content(amusement_park.rides.count)
  # end
  # describe 'rides by Amusement Park ' do
  #   # User story
  #   it "the index can show each ride that is assoicated with the park and it's attribues" do
  #     amusement_park = AmusementPark.create!(name: "Walt Disney World",
  #                                            cost_of_entry: 95,
  #                                            open_year_round: true,)
  #     amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)
  #
  #     ride = amusement_park_2.rides.create!(name: "The Beast",
  #                                         roller_coaster: true,
  #                                         top_speed: 55,)
  #     ride_2 = amusement_park_2.rides.create!(name: "Diamond Back",
  #                                         roller_coaster: true,
  #                                         top_speed: 100,)
  #     ride_3 = amusement_park.rides.create!(name: "Dumbo",
  #                                         roller_coaster: false,
  #                                         top_speed: 15,)
  #     visit "/amusement_parks/#{amusement_park.id}/rides"
  #
  #
  #     expect(page).to have_content(amusement_park.name)
  #     expect(page).to have_content(ride_3.name)
  #     expect(page).to have_content(ride_3.roller_coaster)
  #     expect(page).to have_content(ride_3.top_speed)
  #   end
  # end

  # describe 'user story 9' do
  #   it "should have link to Rides index" do
  #     amusement_park = AmusementPark.create!(name: "Walt Disney World",
  #                                            cost_of_entry: 95,
  #                                            open_year_round: true,)
  #     amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)
  #
  #     ride = amusement_park_2.rides.create!(name: "The Beast",
  #                                         roller_coaster: true,
  #                                         top_speed: 55,)

RSpec.describe 'AmusmentPark' do
  it "can see all amusement park names" do

    amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                           cost_of_entry: 95,
                                           open_year_round: false,)
    amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)

    visit '/amusement_parks'

    expect("King's Island").to appear_before("Walt Disney World", only_text: true)
    expect(page).to have_content(amusement_park.name)
    expect(page).to have_content(amusement_park.created_at)

  end


  it "can see all amusement park names and its attributes" do
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

    expect(page).to have_content(amusement_park.name)
    expect(page).to have_content(amusement_park.cost_of_entry)
    expect(page).to have_content(amusement_park.open_year_round)
    expect(page).to have_content(amusement_park.rides.count)
  end
  describe 'rides by Amusement Park ' do
    # User story
    it "the index can show each ride that is assoicated with the park and it's attribues" do
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
  end

  describe 'user story 9' do
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

  end
end

      # visit "/"
      # page.has_link?(true)
      # page.click_link("Amusement Parks")
      # expect(current_path).to eq('/amusement_parks')

    #   visit "/amusement_parks"
    #   page.has_link?(true)
    #   page.click_link("Amusement Parks")
    #   expect(current_path).to eq('/amusement_parks')
    #
    #   visit "/amusement_parks/#{amusement_park.id}"
    #   page.has_link?(true)
    #   page.click_link("Amusement Parks")
    #   expect(current_path).to eq('/amusement_parks')
    #
    #   visit "/rides"
    #   page.has_link?(true)
    #   page.click_link("Amusement Parks")
    #   expect(current_path).to eq('/amusement_parks')
    #
    #   visit "/rides/#{ride.id}"
    #   page.has_link?(true)
    #   page.click_link("Amusement Parks")
    #   expect(current_path).to eq('/amusement_parks')
    #
    #   visit "/amusement_parks/#{amusement_park.id}/rides"
    #   page.has_link?(true)
    #   page.click_link("Amusement Parks")
    #   expect(current_path).to eq('/amusement_parks')
    # end
  # end
  # describe 'user story 10' do
  #   it "should have link to Rides by amusment park on parent show page" do
  #     amusement_park = AmusementPark.create!(name: "Walt Disney World",
  #                                            cost_of_entry: 95,
  #                                            open_year_round: true,)
  #     amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)
  #
  #     ride = amusement_park_2.rides.create!(name: "The Beast",
  #                                         roller_coaster: true,
  #                                         top_speed: 55,)
  #     ride_2 = amusement_park_2.rides.create!(name: "Diamond Back",
  #                                         roller_coaster: true,
  #                                         top_speed: 100,)
  #     ride_3 = amusement_park.rides.create!(name: "Dumbo",
  #                                         roller_coaster: false,
  #                                         top_speed: 15,)
  #     visit "/amusement_parks/#{amusement_park.id}"
  #     page.has_link?(true)
  #     page.click_link("Rides by Amusement Park")
  #     expect(current_path).to eq("/amusement_parks/#{amusement_park.id}/rides")
  #
  #   end
  # end
#   describe 'user story 11' do
#     it "should have link to create new amusement park record" do
#       amusement_park = AmusementPark.create!(name: "Walt Disney World",
#                                              cost_of_entry: 95,
#                                              open_year_round: true,)
#       amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)
#
#       ride = amusement_park_2.rides.create!(name: "The Beast",
#                                           roller_coaster: true,
#                                           top_speed: 55,)
#       ride_2 = amusement_park_2.rides.create!(name: "Diamond Back",
#                                           roller_coaster: true,
#                                           top_speed: 100,)
#       ride_3 = amusement_park.rides.create!(name: "Dumbo",
#                                           roller_coaster: false,
#                                           top_speed: 15,)
#       visit "/amusement_parks"
#       page.has_link?(true)
#       page.click_link("New Amusement Park")
#       expect(current_path).to eq("/amusement_parks/new")
#     end
#     it "can create a new record for amusement park" do
#       amusement_park = AmusementPark.create!(name: "Walt Disney World",
#                                              cost_of_entry: 95,
#                                              open_year_round: true,)
#       amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)
#
#       ride = amusement_park_2.rides.create!(name: "The Beast",
#                                           roller_coaster: true,
#                                           top_speed: 55,)
#       ride_2 = amusement_park_2.rides.create!(name: "Diamond Back",
#                                           roller_coaster: true,
#                                           top_speed: 100,)
#       ride_3 = amusement_park.rides.create!(name: "Dumbo",
#                                           roller_coaster: false,
#                                           top_speed: 15,)
#       visit "/amusement_parks/new"
#       save_and_open_page
#       fill_in 'Name', with: 'Cedar Point'
#       fill_in 'Cost of entry', with: '105'
#       page.select 'False', :from => 'Is it open year round?'
#       click_button("Create Amusement Park")
#       expect(current_path).to eq('amusement_parks')
#       expect(page). to have_content("Cedar Point")
#     end
#   end
#   describe 'user story 12' do
#     it "has a link to update a record on the amusement park show page" do
#       amusement_park = AmusementPark.create!(name: "Walt Disney World",
#                                              cost_of_entry: 95,
#                                              open_year_round: true,)
#       amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)
#
#       ride = amusement_park_2.rides.create!(name: "The Beast",
#                                           roller_coaster: true,
#                                           top_speed: 55,)
#       ride_2 = amusement_park_2.rides.create!(name: "Diamond Back",
#                                           roller_coaster: true,
#                                           top_speed: 100,)
#       ride_3 = amusement_park.rides.create!(name: "Dumbo",
#                                           roller_coaster: false,
#                                           top_speed: 15,)
#       visit "/amusement_parks/#{amusement_park_2.id}"
#       save_and_open_page
#
#       page.click_link("Edit Amusement Park")
#       expect(current_path).to eq("/amusement_parks/#{amusement_park_2.id}/edit")
#     end
#     it "has a form to update a record on the amusement park show page" do
#       amusement_park = AmusementPark.create!(name: "Walt Disney World",
#                                              cost_of_entry: 95,
#                                              open_year_round: true,)
#       amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)
#
#       ride = amusement_park_2.rides.create!(name: "The Beast",
#                                           roller_coaster: true,
#                                           top_speed: 55,)
#       ride_2 = amusement_park_2.rides.create!(name: "Diamond Back",
#                                           roller_coaster: true,
#                                           top_speed: 100,)
#       ride_3 = amusement_park.rides.create!(name: "Dumbo",
#                                           roller_coaster: false,
#                                           top_speed: 15,)
#       visit "/amusement_parks/#{amusement_park_2.id}"
#       expect(page).to have_content(45)
#       page.click_link("Edit Amusement Park")
#       fill_in 'Name', with: "King's Island"
#       fill_in 'cost_of_entry', with: 55
#       click_button 'Update Amusement Park'
#       expect(current_path). to eq("/amusement_parks/#{amusement_park_2.id}")
#       expect(page).to have_content(55)
#     end
#   end
end
