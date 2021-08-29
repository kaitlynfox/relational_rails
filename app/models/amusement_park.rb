
class AmusementPark < ApplicationRecord
  has_many :rides

  def self.ordered_parks
    order(:created_at)
  end

end
