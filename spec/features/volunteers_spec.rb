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

    visit '/volunteers'

    expect(page).to have_content(volunteer.name)
    expect(page).to have_content(volunteer.certified_trainer)
    expect(page).to have_content(volunteer.years_of_experience)
  end

  xit "can see all amusement park names and its attributes" do
    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

    volunteer = zoo.volunteers.create!(name: "Karen Dale",
                                  certified_trainer: true,
                                  years_of_experience: 4,)

    visit "/volunteer/#{volunteer.id}"

    expect(page).to have_content(volunteer.name)

  end
end
