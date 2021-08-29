require 'rails_helper'

RSpec.describe Rides do
  it {should belongs_to :amusement_park}
end
