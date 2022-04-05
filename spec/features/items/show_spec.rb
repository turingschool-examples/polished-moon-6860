require "rails_helper"

RSpec.describe "items show page" do
  before :each do
    @wood_floor = Project.create!(name: "floor repair", manager: "Gary")
    @sander = @wood_floor.items.create!(name: "sander", cost: 4)
    @varnish = @wood_floor.items.create!(name: "varnish", cost: 10)

    @remodel = Manufacturer.create!(name: "Remodel", location: "Golden, CO")
    @diy = Manufacturer.create!(name: "DIY Tools", location: "Arvada, CO")

    @varnish.manufacturers << @remodel
    @varnish.manufacturers << @diy
  end

  it "displays item name and cost" do
    visit "/items/#{@sander.id}"

    expect(page).to have_content("sander")
    expect(page).to have_content("4")
    expect(page).to have_content("floor repair")
  end

  it "shows number of manufacturers for this item" do
    visit "/items/#{@sander.id}"

    expect(page).to have_content("Number of Manufacturers: 0")

    visit "/items/#{@varnish.id}"

    expect(page).to have_content("Number of Manufacturers: 2")
  end
end
