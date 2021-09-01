class Volunteer < ApplicationRecord
  belongs_to :zoo

  def self.experienced(years)
    years = 0 if years == nil
    self.where("years_of_experience > #{years}")
  end
end
