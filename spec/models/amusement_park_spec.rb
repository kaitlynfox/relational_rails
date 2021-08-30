require 'rails_helper'

RSpec.describe AmusementPark do
  it {should have_many :rides}

  describe 'instance methods' do
    describe '#ordered_parks' do
      it 'can list amusement park names in order by when they were created' do
        amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                               cost_of_entry: 95,
                                               open_year_round: false,)
        amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)
  
        expect("King's Island").to appear_before("Walt Disney World", only_text: true)

      end
    end
  end

end
