require 'rails_helper'

RSpec.describe Ride do
  it {should belong_to :amusement_park}


  describe 'instance methods' do
    describe '#true_rides' do
      it 'only lists rides that are roller coasters (true)' do
        amusement_park = AmusementPark.create!(name: "Walt Disney World",
                                              cost_of_entry: 95,
                                              open_year_round: true,)
        amusement_park_2 = AmusementPark.create!(name: "King's Island", cost_of_entry: 45, open_year_round: false)

        ride = amusement_park_2.rides.create!(name: "The Beast",
                                            roller_coaster: true,
                                            top_speed: 55,)
        ride_2 = amusement_park_2.rides.create!(name: "Diamond Back",
                                            roller_coaster: true,
                                            top_speed: 100,)
        ride_3 = amusement_park.rides.create!(name: "Dumbo",
                                            roller_coaster: false,
                                            top_speed: 15,)

        expect(Ride.true_rides).to eq([ride, ride_2])
      end
    end

  end
end
