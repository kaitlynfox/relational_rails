require 'rails_helper'

RSpec.describe 'the volunteers index page' do
  it "can see all volunteers names" do

    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

    volunteer = zoo.volunteers.create!(name: "Karen Dale",
                                  certified_trainer: true,
                                  years_of_experience: 4,)

    volunteer_2 = zoo.volunteers.create!(name: "Dale",
                                  certified_trainer: true,
                                  years_of_experience: 4,)

    visit '/volunteers'

    expect(page).to have_content(volunteer.name)
    expect(page).to have_content(volunteer.certified_trainer)
    expect(page).to have_content(volunteer.years_of_experience)
    expect(page).to have_content(volunteer.id)
    expect(page).to have_content(volunteer.created_at)
    expect(page).to have_content(volunteer.updated_at)
  end

  it "can see all volunteer names and its attributes" do
    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

    volunteer = Volunteer.create!(name: "Karen Dale",
                                  certified_trainer: true,
                                  years_of_experience: 4,
                                  zoo_id: zoo.id)

    visit "/volunteers/#{volunteer.id}"

    expect(page).to have_content(volunteer.name)
    expect(page).to have_content(volunteer.certified_trainer)
    expect(page).to have_content(volunteer.years_of_experience)
    expect(page).to have_content(volunteer.id)
    expect(page).to have_content(volunteer.created_at)
    expect(page).to have_content(volunteer.updated_at)
  end

  # User Story 14
  it "can see all volunteer names and its attributes" do
    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

    volunteer = Volunteer.create!(name: "Karn Dale",
                                  certified_trainer: true,
                                  years_of_experience: 4,
                                  zoo_id: zoo.id)

    visit "/volunteers/#{volunteer.id}"

    click_link("Update Volunteer")

    expect(current_path).to eq("/volunteers/#{volunteer.id}/edit")

    fill_in("name", with: "Karen Dale")
    fill_in("certified_trainer", with: "true")
    fill_in("years_of_experience", with: 4)

    click_button("Update Volunteer")

    expect(current_path).to eq("/volunteers/#{volunteer.id}")
  end

  # User Story 15
  it "can see all amusement park names and its attributes" do
    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

    volunteer_1 = Volunteer.create!(name: "Karen Dale",
                                  certified_trainer: true,
                                  years_of_experience: 4,
                                  zoo_id: zoo.id)

    volunteer_2 = Volunteer.create!(name: "Donald Dale",
                                  certified_trainer: false,
                                  years_of_experience: 8,
                                  zoo_id: zoo.id)

    visit "/volunteers"

    expect(page).to have_content("Karen Dale")
  end

  # User Story 18
  it "can edit a volunteer's info" do
    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

    volunteer = Volunteer.create!(name: "Karen Dale",
                                  certified_trainer: true,
                                  years_of_experience: 4,
                                  zoo_id: zoo.id)

    visit "/volunteers"
    page.has_link?("Update Volunteer")
    click_link("Update Volunteer")

    fill_in("name", with: "Karen Dale")
    fill_in("certified_trainer", with: false)
    fill_in("years_of_experience", with: 4)

    expect(current_path).to eq("/volunteers/#{volunteer.id}/edit")
  end

  # User Story 20
  it "can delete a volunteer" do
    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

    volunteer = Volunteer.create!(name: "Karen Dale",
                                  certified_trainer: true,
                                  years_of_experience: 4,
                                  zoo_id: zoo.id)

    visit "/volunteers/#{volunteer.id}"
    page.has_button?("Delete Volunteer")
  end

  # User Story 21
  it "can list volunteers that have years experience greater than the user input" do
    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

    volunteer_1 = zoo.volunteers.create!(name: "Karen Dale",
                                  certified_trainer: false,
                                  years_of_experience: 2)

    volunteer_2 = zoo.volunteers.create!(name: "Tommy Dale",
                                  certified_trainer: true,
                                  years_of_experience: 4)

    visit "/zoos/#{zoo.id}/volunteers"
    fill_in(:years_of_experience, with: 3)
    click_button("Only return volunteers that have more than this many years experience")
    expect(page).to have_content(volunteer_2.name)
    expect(page).not_to have_content(volunteer_1.name)
  end

  # User Story 22
  it "can delete a zoo from the zoos main page" do
    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

    visit "/zoos"
    expect(page).to have_content("Denver City Zoo")
    page.has_button?("Delete Zoo")
    click_button("Delete Zoo")

    expect(page).to_not have_content("Denver City Zoo")
    expect(current_path).to eq("/zoos")
  end

  # User Story 23
  it "can delete a volunteer from the volunteer or zoo/volunteers page" do
    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

    volunteer = Volunteer.create!(name: "Karen Dale",
                                  certified_trainer: true,
                                  years_of_experience: 4,
                                  zoo_id: zoo.id)

    visit "/volunteers"
    expect(page).to have_content("Karen Dale")
    page.has_button?("Delete Volunteer")
    click_button("Delete Volunteer")

    expect(page).not_to have_content("Karen Dale")
    expect(current_path).to eq("/volunteers")
  end
end
