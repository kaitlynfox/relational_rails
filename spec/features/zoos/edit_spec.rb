require "rails_helper"

RSpec.describe "the zoos edit" do

  # User Story 12
  it "links to the edit page" do

    zoo = Zoo.create!(name: "Allen City Zoo",
                      rank: 12,
                      state_funding: true,
                      city: "Allen")

    visit "/zoos/#{zoo.id}"
    click_link("Update Zoo")

    expect(current_path).to eq("/zoos/#{zoo.id}/edit")
  end

  # User Story 12
  it "can edit the zoo" do

    zoo = Zoo.create!(name: "Denverrr City Zoo",
                      rank: 1,
                      state_funding: true,
                      city: "Denver")

    visit "/zoos/#{zoo.id}"
    expect(page).to have_content("Denverrr City Zoo")

    click_link("Update Zoo")

    fill_in("Name", with: "Denver City Zoo")
    fill_in("Rank", with: 1)
    fill_in("state_funding", with: true)
    fill_in("City", with: "Denver")

    save_and_open_page

    click_button("Update Zoo")

    expect(current_path).to eq("/zoos/#{zoo.id}")
    expect(page).to have_content("Denver City Zoo")
  end
end
