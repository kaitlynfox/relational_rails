
class AmusementPark < ApplicationRecord
  has_many :rides

  def self.ordered_parks
    order(created_at: :DESC)
  end

  def alpha_rides_by_park(alphabetize = false)
    if alphabetize 
      rides.order(:name)
    else
      rides
    end
  end
end
