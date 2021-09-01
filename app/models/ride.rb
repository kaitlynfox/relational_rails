class Ride < ApplicationRecord
  belongs_to :amusement_park

  def self.true_rides
    where(roller_coaster: true)
  end

  def self.fast_rides(num)
    num = 0 if num == nil
    where("top_speed > #{num}")
  end
end
