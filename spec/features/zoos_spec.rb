require 'rails_helper'

RSpec.describe 'the zoos index page' do
  it "can see all zoos names" do
    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

    visit '/zoos'

    save_and_open_page

    expect(page).to have_content(zoo.name)
  end

  it "can see a zoo with the id and attributes" do
    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

  visit "/zoos/#{zoo.id}"

  expect(page).to have_content(zoo.name)
  expect(page).to have_content(zoo.rank)
  expect(page).to have_content(zoo.state_funding)
  expect(page).to have_content(zoo.city)
  end

  # User Story 5
  it "can see each volunteer that is associated with a Zoo" do
    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

    volunteer_1 = zoo.volunteers.create!(name: "Karen Dale",
                                  certified_trainer: true,
                                  years_of_experience: 4,)

    volunteer_2 = zoo.volunteers.create!(name: "Scott Dale",
                                  certified_trainer: false,
                                  years_of_experience: 1,)

  visit "/zoos/#{zoo.id}/volunteers"

  save_and_open_page

  expect(page).to have_content(zoo.name)
  expect(page).to have_content(volunteer_1.name)
  expect(page).to have_content(volunteer_1.certified_trainer)
  expect(page).to have_content(volunteer_1.years_of_experience)
  expect(page).to have_content(volunteer_2.name)
  expect(page).to have_content(volunteer_2.certified_trainer)
  expect(page).to have_content(volunteer_2.years_of_experience)
  end

  # User Story 6
  it "can see each Zoo listed in order by the most recently created Zoo" do
    zoo_1 = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

    zoo_2 = Zoo.create!(name: "Austin Zoo",
                      rank: 10,
                      state_funding: false,
                      city: "Austin")

    zoo_3 = Zoo.create!(name: "Memphis Zoo",
                      rank: 10,
                      state_funding: false,
                      city: "Memphis")

    visit "/zoos"

    save_and_open_page

    # Capybara
    expect("Memphis").to appear_before("Austin", only_text: true)

    expect(page).to have_content(zoo_1.name)
    expect(page).to have_content(zoo_1.created_at)

    expect(page).to have_content(zoo_2.name)
    expect(page).to have_content(zoo_2.created_at)

    expect(page).to have_content(zoo_3.name)
    expect(page).to have_content(zoo_3.created_at)
  end

  # User Story 7
  it "can see a count of the number of volunteers at that zoo" do

    zoo = Zoo.create!(name: "Denver City Zoo",
                        rank: 3,
                        state_funding: true,
                        city: "Denver")

    volunteer_1 = zoo.volunteers.create!(name: "Karen Dale",
                                         certified_trainer: true,
                                         years_of_experience: 4,)

    volunteer_2 = zoo.volunteers.create!(name: "Scott Dale",
                                         certified_trainer: false,
                                         years_of_experience: 1,)

    visit "/zoos/#{zoo.id}"
    # save_and_open_page

    expect(page).to have_content(zoo.name)
    expect(page).to have_content(zoo.volunteers.count == 2)
  end

  # User Story 8
  it "can see a link to the volunteers at the top of a page" do

    zoo = Zoo.create!(name: "Denver City Zoo",
                        rank: 3,
                        state_funding: true,
                        city: "Denver")

    volunteer_1 = zoo.volunteers.create!(name: "Karen Dale",
                                         certified_trainer: true,
                                         years_of_experience: 4,)

    volunteer_2 = zoo.volunteers.create!(name: "Scott Dale",
                                         certified_trainer: false,
                                         years_of_experience: 1,)

    # Welcome index
    # visit "/"
    # page.has_link?(true)
    # page.click_link("Volunteers")

    # save_and_open_page

    # Zoos index
    # visit '/zoos'
    # page.has_link?(true)
    # page.click_link("Volunteers")

    # Zoos show
    # visit "/zoos/#{zoo.id}"
    # page.has_link?(true)
    # page.click_link("Volunteers")

    # Volunteers index
    # visit '/volunteers'
    # page.has_link?(true)
    # page.click_link("Volunteers")

    # Volunteers show
    # visit "/volunteers/#{volunteer_1.id}"
    # page.has_link?(true)
    # page.click_link("Volunteers")

    # Volunteers by Zoo
    # visit "/zoos/#{zoo.id}/volunteers"
    # page.has_link?(true)
    # page.click_link("Volunteers")
  end

  # User Story 9
  it "can see a link to the zoos at the top of a page" do

    zoo = Zoo.create!(name: "Denver City Zoo",
                        rank: 3,
                        state_funding: true,
                        city: "Denver")

    volunteer_1 = zoo.volunteers.create!(name: "Karen Dale",
                                         certified_trainer: true,
                                         years_of_experience: 4,)

    volunteer_2 = zoo.volunteers.create!(name: "Scott Dale",
                                         certified_trainer: false,
                                         years_of_experience: 1,)

    # Welcome index
    # visit "/"
    # page.has_link?(true)
    # page.click_link("Zoos")

    # Zoos index
    # visit '/zoos'
    # page.has_link?(true)
    # page.click_link("Zoos")

    # Zoos show
    # visit "/zoos/#{zoo.id}"
    # page.has_link?(true)
    # page.click_link("Zoos")

    # Volunteers index
    # visit '/volunteers'
    # page.has_link?(true)
    # page.click_link("Zoos")

    # Volunteers show
    # visit "/volunteers/#{volunteer_1.id}"
    # page.has_link?(true)
    # page.click_link("Zoos")

    # Volunteers by Zoo
    # visit "/zoos/#{zoo.id}/volunteers"
    # page.has_link?(true)
    # page.click_link("Zoos")

    # save_and_open_page
  end
end
