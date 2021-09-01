require 'rails_helper'

describe AmusementPark do
  it {should have_many :rides}

  describe 'instance methods' do
    before :each do
      @amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                            cost_of_entry: 95,
                                            open_year_round: false,)
      @amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)

      @ride = @amusement_park_2.rides.create!(name: "The Beast",
                                          roller_coaster: true,
                                          top_speed: 55,)
      @ride_2 = @amusement_park_2.rides.create!(name: "Diamond Back",
                                          roller_coaster: true,
                                          top_speed: 100,)

    end
    describe '#ordered_parks' do
      it 'can list amusement park names in order by when they were created' do

        expect(AmusementPark.ordered_parks).to eq([@amusement_park_2, @amusement_park])
      end
    end
    describe '#alpha_rides_by_park' do
      it 'can alphabetize rides by park if user clicks button' do

        expect(@amusement_park_2.alpha_rides_by_park(true)).to eq([@ride_2, @ride])
        expect(@amusement_park_2.alpha_rides_by_park(false)).to eq([@ride, @ride_2])

      end
    end
  end
end
