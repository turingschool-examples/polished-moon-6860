require "rails_helper"

RSpec.describe "Projects Show Page" do
  before :each do
    @wood_floor = Project.create!(name: "floor repair", manager: "Gary")
    @sander = @wood_floor.items.create!(name: "sander", cost: 412.16)
    @varnish = @wood_floor.items.create!(name: "varnish", cost: 102.45)
  end

  xit "shows average cost of items to two decimal places" do
    visit "/projects/#{@wood_floor.id}"

    expect(page).to have_content("Average Cost Per Item: $257.00 ")
  end
end
