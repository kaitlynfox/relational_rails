require 'rails_helper'

RSpec.describe Zoo do
  it {should have_many :volunteers}

  # User Story 6
  describe 'instance methods' do
    describe '#ordered' do
      it "can list zoo names in order by when they were created" do
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

        expect(Zoo.ordered).to eq([zoo_3, zoo_2, zoo_1])
      end
    end
  end
end
