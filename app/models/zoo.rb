class Zoo < ApplicationRecord
  has_many :volunteers, dependent: :destroy

  def self.ordered
    order(created_at: :desc)
    # @zoos = Zoo.order(created_at: :desc)
  end
end
