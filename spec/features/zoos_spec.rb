require 'rails_helper'

RSpec.describe 'the zoos index page', type: :feature do
  it "can see all zoos names" do
    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

  visit '/zoos'

  expect(page).to have_content(zoo.name)
  end
end
