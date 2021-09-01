require 'rails_helper'

RSpec.describe 'index page' do
  it "should have link to Rides index" do
    visit "/"
    page.has_link?(true)
    page.click_link("Rides")
    expect(current_path).to eq('/rides')
  end
  it "should have link to amusement parks index" do
    visit "/"
    page.has_link?(true)
    page.click_link("Amusement Parks")
    expect(current_path).to eq('/amusement_parks')
  end
  it "should have link to zoos index" do
    visit "/"
    page.has_link?(true)
    page.click_link("Zoos")
    expect(current_path).to eq('/zoos')
  end
  it "should have link to volunteers index" do
    visit "/"
    page.has_link?(true)
    page.click_link("Volunteers")
    expect(current_path).to eq('/volunteers')
  end
end
