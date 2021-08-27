class Zoo < ApplicationRecord
  has_many :volunteers

  def ordered
    @zoos = Zoo.order(created_at: :desc)
  end
end
