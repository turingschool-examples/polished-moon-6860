require 'rails_helper'

RSpec.describe 'items show page' do
  before (:each) do
    @project = Project.create!(name: "New House", manager: "Joe Smith")

    @manufacturer1 = Manufacturer.create!(name: "Woody's Furniture", location: "Dallas, TX")
    @manufacturer2 = Manufacturer.create!(name: "Light it Up", location: "Spokane, WA")
    @manufacturer3 = Manufacturer.create!(name: "Drapes n Things", location: "Raleigh, NC")

    @item1 = @project.items.create!(name: "Chair", cost: 34)
    @item2 = @project.items.create!(name: "Bed frame", cost: 340)
    @item3 = @project.items.create!(name: "Blackout curtains", cost: 65)

    ManufacturerItem.create!(item: @item1, manufacturer: @manufacturer1)
    ManufacturerItem.create!(item: @item1, manufacturer: @manufacturer3)
    ManufacturerItem.create!(item: @item2, manufacturer: @manufacturer1)
    ManufacturerItem.create!(item: @item3, manufacturer: @manufacturer2)
    ManufacturerItem.create!(item: @item3, manufacturer: @manufacturer3)
  end

  it 'shows the item name, cost and which project it belongs to' do
    visit "/items/#{@item1.id}"
    expect(page).to have_content("Chair")
    expect(page).to have_content(34)
    expect(page).to have_content("New House")
    expect(page).not_to have_content("Bed frame")
  end

  it 'shows how many manufacturers there are for this item' do
    visit "/items/#{@item1.id}"
    expect(page).to have_content("Manufacturers Available for Chair: 2")

    visit "/items/#{@item2.id}"
    expect(page).to have_content("Manufacturers Available for Bed frame: 1")

    visit "/items/#{@item3.id}"
    expect(page).to have_content("Manufacturers Available for Blackout curtains: 2")
  end
end
