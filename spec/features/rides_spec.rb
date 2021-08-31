# require 'rails_helper'
#
# RSpec.describe 'Rides' do
#   # it "index page can see the rides name and attributes" do
#   #
#   #   amusement_park = AmusementPark.create!(name: "Walt Disney World",
#   #                                          cost_of_entry: 95,
#   #                                          open_year_round: false,)
#   #
#   #   ride = amusement_park.rides.create!(name: "The Beast",
#   #                                       roller_coaster: true,
#   #                                       top_speed: 55,)
#   #   ride_2 = amusement_park.rides.create!(name: "Diamond Back",
#   #                                       roller_coaster: true,
#   #                                       top_speed: 100,)
#   #
#   #   visit "/rides"
#   #
#   #   save_and_open_page
#   #
#   #   expect(page).to have_content(ride.name)
#   #   expect(page).to have_content(ride.roller_coaster)
#   #   expect(page).to have_content(ride.top_speed)
#   #   expect(page).to have_content(ride_2.name)
#   #   expect(page).to have_content(ride_2.roller_coaster)
#   #   expect(page).to have_content(ride_2.top_speed)
#   # end
#
#   # it "show page can see child by id with attributes" do
#   #
#   #   amusement_park = AmusementPark.create!(name: "Walt Disney World",
#   #                                          cost_of_entry: 95,
#   #                                          open_year_round: false,)
#   #
#   #   ride = amusement_park.rides.create!(name: "The Beast",
#   #                                       roller_coaster: true,
#   #                                       top_speed: 55,)
#   #
#   #
#   #   visit "/rides/#{ride.id}"
#   #
#   #   save_and_open_page
#   #
#   #   expect(page).to have_content(ride.name)
#   #   expect(page).to have_content(ride.roller_coaster)
#   #   expect(page).to have_content(ride.top_speed)
#   #
#   # end
#   describe 'user story 8' do
#     it "should have link to Rides index on all pages" do
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
#       # visit "/"
#       # page.has_link?(true)
#       # page.click_link("Rides")
#
#
#       # visit "/amusement_parks"
#       # page.has_link?(true)
#       # page.click_link("Rides")
#
#       # visit "/amusement_parks/#{amusement_park.id}"
#       # page.has_link?(true)
#       # page.click_link("Rides")
#
#       # visit "/rides"
#       # page.has_link?(true)
#       # page.click_link("Rides")
#
#       # visit "/rides/#{ride.id}"
#       # page.has_link?(true)
#       # page.click_link("Rides")
#
#       # visit "/amusement_parks/#{amusement_park.id}/rides"
#       # page.has_link?(true)
#   #     # page.click_link("Rides")
#   #   end
#   # end
#   # describe 'user story 13' do
#   #   it "parent child index page should have link to create new ride record" do
#   #     amusement_park = AmusementPark.create!(name: "Walt Disney World",
#   #                                            cost_of_entry: 95,
#   #                                            open_year_round: true,)
#   #     amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)
#   #
#   #     ride = amusement_park_2.rides.create!(name: "The Beast",
#   #                                         roller_coaster: true,
#   #                                         top_speed: 55,)
#   #     ride_2 = amusement_park_2.rides.create!(name: "Diamond Back",
#   #                                         roller_coaster: true,
#   #                                         top_speed: 100,)
#   #     ride_3 = amusement_park.rides.create!(name: "Dumbo",
#   #                                         roller_coaster: false,
#   #                                         top_speed: 15,)
#   #     visit "/amusement_parks/#{amusement_park.id}/rides"
#   #     page.has_link?(true)
#   #     page.click_link("Add New Ride")
#   #     expect(current_path).to eq("/amusement_parks/#{amusement_park.id}/rides/new")
#   #   end
#   #   it "can create a new record for ride by amusement park" do
#   #     amusement_park = AmusementPark.create!(name: "Walt Disney World",
#   #                                            cost_of_entry: 95,
#   #                                            open_year_round: true,)
#   #     amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)
#   #
#   #     ride = amusement_park_2.rides.create!(name: "The Beast",
#   #                                         roller_coaster: true,
#   #                                         top_speed: 55,)
#   #     ride_2 = amusement_park_2.rides.create!(name: "Diamond Back",
#   #                                         roller_coaster: true,
#   #                                         top_speed: 100,)
#   #     ride_3 = amusement_park.rides.create!(name: "Dumbo",
#   #                                         roller_coaster: false,
#   #                                         top_speed: 15,)
#   #     visit "/amusement_parks/#{amusement_park.id}/rides/new"
#   #     save_and_open_page
#   #     fill_in 'Name', with: "Rock 'n' Roller Coaster"
#   #     fill_in 'Top speed', with: '57'
#   #     check "Check box if the ride is a roller coaster:"
#   #     click_button("Create Ride")
#   #     expect(current_path).to eq("/amusement_parks/#{amusement_park.id}/rides")
#   #     expect(page). to have_content("Rock 'n' Roller Coaster")
#   #   end
#   # end
#   describe 'user story 14' do
#     it "has a link to update a record on the ride show page" do
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
#       visit "/rides/#{ride.id}"
#       save_and_open_page
#
#       page.click_link("Edit Ride")
#       expect(current_path).to eq("/rides/#{ride.id}/edit")
#     end
#     it "has a form to update a record on the ride show page" do
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
#       visit "/rides/#{ride.id}"
#       expect(page).to have_content(55)
#       page.click_link("Edit Ride")
#       fill_in 'Name', with: "The Beast"
#       fill_in 'Top speed', with: 65
#       click_button 'Update Ride'
#       expect(current_path). to eq("/rides/#{ride.id}")
#       save_and_open_page
#       expect(page).to have_content(65)
#     end
#   end
# end
