require 'rails_helper'

RSpec.describe Volunteer do
  it {should belong_to :zoo}
end
