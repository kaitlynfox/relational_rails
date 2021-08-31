require 'rails_helper'

RSpec.describe 'New' do
  it "can create a new record for amusement park" do
    visit "/amusement_parks/new"
    # save_and_open_page
    fill_in 'Name', with: 'Cedar Point'
    fill_in 'Cost of entry', with: '105'
    check "Check box if the park is open year round:"
    click_button("Create Amusement Park")
    expect(current_path).to eq('/amusement_parks')
    expect(page). to have_content("Cedar Point")
  end
end
