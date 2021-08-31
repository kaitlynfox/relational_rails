class Ride < ApplicationRecord
  belongs_to :amusement_park

  def self.true_rides
    where(roller_coaster: true)
  end
end
