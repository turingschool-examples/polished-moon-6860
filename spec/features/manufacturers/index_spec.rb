require "rails_helper"

RSpec.describe "manufacturers index" do
  before :each do
    @wood_floor = Project.create!(name: "floor repair", manager: "Gary")
    @sander = @wood_floor.items.create!(name: "sander", cost: 4)
    @varnish = @wood_floor.items.create!(name: "varnish", cost: 10)

    @remodel = Manufacturer.create!(name: "Remodel", location: "Golden, CO")
    @diy = Manufacturer.create!(name: "DIY Tools", location: "Arvada, CO")

    @varnish.manufacturers << @remodel
    @varnish.manufacturers << @diy
  end

  it "lists manufacturers names and item names" do
    visit "/manufacturers"

    expect(page).to have_content(@remodel.name)
    expect(page).to have_content(@diy.name)
    expect(page).to have_content(@varnish.name)
    expect(page).to_not have_content(@sander.name)
  end
end
