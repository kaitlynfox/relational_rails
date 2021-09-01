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

  # # User Story 6
  # it "can see each Zoo listed in order by the most recently created Zoo" do
  #   zoo_1 = Zoo.create!(name: "Denver City Zoo",
  #                     rank: 3,
  #                     state_funding: true,
  #                     city: "Denver")
  #
  #   zoo_2 = Zoo.create!(name: "Austin Zoo",
  #                     rank: 10,
  #                     state_funding: false,
  #                     city: "Austin")
  #
  #   zoo_3 = Zoo.create!(name: "Memphis Zoo",
  #                     rank: 10,
  #                     state_funding: false,
  #                     city: "Memphis")
  #
  #   visit "/zoos"
  #
  #   save_and_open_page
  #
  #   # Capybara
  #   expect("Memphis").to appear_before("Austin", only_text: true)
  #
  #   expect(page).to have_content(zoo_1.name)
  #   expect(page).to have_content(zoo_1.created_at)
  #
  #   expect(page).to have_content(zoo_2.name)
  #   expect(page).to have_content(zoo_2.created_at)
  #
  #   expect(page).to have_content(zoo_3.name)
  #   expect(page).to have_content(zoo_3.created_at)
  # end

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

    # Zoos/New
    visit "/zoos/new"
    page.has_link?("Volunteers")
    page.click_link("Volunteers")
    expect(current_path).to eq('/volunteers')

    # Zoos/edit
    visit "/zoos/#{zoo.id}/edit"
    page.has_link?("Volunteers")
    page.click_link("Volunteers")
    expect(current_path).to eq('/volunteers')

    # volunteer/edit
    visit "/volunteers/#{volunteer.id}/edit"
    page.has_link?("Volunteers")
    page.click_link("Volunteers")
    expect(current_path).to eq('/volunteers')

    # volunteer_by_zoos/new
    visit "/zoos/#{zoo.id}/volunteers/new"
    page.has_link?("Volunteers")
    page.click_link("Volunteers")
    expect(current_path).to eq('/volunteers')

    # Zoos index
    visit '/zoos'
    page.has_link?("Volunteers")
    page.click_link("Volunteers")
    expect(current_path).to eq('/volunteers')

    # Zoos show
    visit "/zoos/#{zoo.id}"
    page.has_link?("Volunteers")
    page.click_link("Volunteers")
    expect(current_path).to eq('/volunteers')

    # Volunteers index
    visit '/volunteers'
    page.has_link?("Volunteers")
    page.click_link("Volunteers")
    expect(current_path).to eq('/volunteers')

    # Volunteers show
    visit "/volunteers/#{volunteer_1.id}"
    page.has_link?("Volunteers")
    page.click_link("Volunteers")
    expect(current_path).to eq('/volunteers')

    # Volunteers by Zoo
    page.has_link?("Volunteers")
    page.click_link("Volunteers")
    expect(current_path).to eq('/volunteers')
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

    # Zoos index
    visit '/zoos'
    page.has_link?("Zoos")
    page.click_link("Zoos")
    expect(current_path).to eq('/zoos')

    # Zoos/edit
    visit "/zoos/#{zoo.id}/edit"
    page.has_link?("Zoos")
    page.click_link("Zoos")
    expect(current_path).to eq('/zoos')

    # Zoos/new
    visit "/zoos/new"
    page.has_link?("Zoos")
    page.click_link("Zoos")
    expect(current_path).to eq('/zoos')

    # Volunteers/edit
    visit "/volunteers/#{volunteer.id}/edit"
    page.has_link?("Zoos")
    page.click_link("Zoos")
    expect(current_path).to eq('/zoos')

    # volunteers_by_zoo/new
    visit "/zoos/#{zoo.id}/volunteers/new"
    page.has_link?("Zoos")
    page.click_link("Zoos")
    expect(current_path).to eq('/zoos')

    # Zoos show
    visit "/zoos/#{zoo.id}"
    page.has_link?("Zoos")
    page.click_link("Zoos")
    expect(current_path).to eq('/zoos')

    # Volunteers index
    visit '/volunteers'
    page.has_link?("Zoos")
    page.click_link("Zoos")
    expect(current_path).to eq('/zoos')

    # Volunteers show
    visit "/volunteers/#{volunteer_1.id}"
    page.has_link?("Zoos")
    page.click_link("Zoos")
    expect(current_path).to eq('/zoos')

    # Volunteers by Zoo
    visit "/zoos/#{zoo.id}/volunteers"
    page.has_link?("Zoos")
    page.click_link("Zoos")
    expect(current_path).to eq('/zoos')
  end

  # User Story 10
  it "can see a link on the zoo's page that takes you to the zoo's volunteers" do

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
    page.has_link?(true)

    expect(page).to have_link("See this zoo's volunteers here.")
  end

  # User Story 11
  it "can link to the new page from the zoo index" do
    visit '/zoos'
    click_link("New Zoo")

    expect(current_path).to eq('/zoos/new')

    visit '/zoos/new'
    fill_in("name", with: "Dallas City Zoo")
    fill_in("rank", with: "4")
    # select("Option", from: "State Funding")
    # page.has_select?("state_funding", selected: [true, false])
    # find(:select, "state_funding").send_keys :enter
    # select 'state_funding', from: "state_funding"
    # fill_in("state_funding", with: false)
    fill_in("city", with: "Dallas")
  end

  # User Story 13
  it "can link to the create page and create a new volunteer" do

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
    click_link("Create Volunteer")

    expect(current_path).to eq("/zoos/#{zoo.id}/volunteers/new")

    fill_in("name", with: "Bobby Dale")
    fill_in("certified_trainer", with: true)
    fill_in("years_of_experience", with: 8)

    click_button("Create Volunteer")

    expect(current_path).to eq("/zoos/#{zoo.id}/volunteers")

    expect(page).to have_content("Bobby Dale")
  end

  # User Story 16
  it "can link to the create page and create a new volunteer" do

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

    volunteer_3 = zoo.volunteers.create!(name: "Adam Dale",
                                         certified_trainer: false,
                                         years_of_experience: 1,)

    visit "/zoos/#{zoo.id}/volunteers"
    page.has_link?(true)

    click_link("Sort Alphabetically")

    expect(current_path).to eq("/zoos/#{zoo.id}/volunteers")
  end

  # User Story 17
  it "can visit the Zoo page and select a specific zoo to edit" do

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

    volunteer_3 = zoo.volunteers.create!(name: "Adam Dale",
                                         certified_trainer: false,
                                         years_of_experience: 1,)

    visit "/zoos"
    click_link("Update Zoo")

    expect(current_path).to eq("/zoos/#{zoo.id}/edit")
  end

  # User Story 19
  it "can delete a zoo" do

    zoo_1 = Zoo.create!(name: "Denver City Zoo",
                        rank: 3,
                        state_funding: true,
                        city: "Denver")

    zoo_2 = Zoo.create!(name: "Austin City Zoo",
                        rank: 4,
                        state_funding: false,
                        city: "Austin")

    volunteer_1 = zoo_1.volunteers.create!(name: "Karen Dale",
                                         certified_trainer: true,
                                         years_of_experience: 4,)


    visit "/zoos/#{zoo_1.id}"
    click_button("Delete Zoo")

    expect(current_path).to eq("/zoos")
  end
end
