require 'rails_helper'

RSpec.describe Volunteer do
  it {should belong_to :zoo}


  it "can display volunteers with a certain amount of experience" do
    zoo = Zoo.create!(name: "Denver City Zoo",
                      rank: 3,
                      state_funding: true,
                      city: "Denver")

    volunteer_1 = zoo.volunteers.create!(name: "Karen Dale",
                                  certified_trainer: true,
                                  years_of_experience: 4,)

    volunteer_2 = zoo.volunteers.create!(name: "Darren Dale",
                                  certified_trainer: true,
                                  years_of_experience: 4,)

    expect(Volunteer.experienced(nil)).to eq([volunteer_1, volunteer_2])
  end
end
