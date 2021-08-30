
class AmusementPark < ApplicationRecord
  has_many :rides

  def self.ordered_parks
    order(created_at: :DESC)
  end

end
