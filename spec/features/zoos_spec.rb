require 'rails_helper'

RSpec.describe 'the zoos index page' do
  it "can see all zoos names" do
    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

    visit '/zoos'

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
end
