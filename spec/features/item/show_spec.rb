require 'rails_helper'

RSpec.describe 'the item show page' do
  it 'I see that items name and cost' do
    manufacturer_1 = Manufacturer.create!(name: "B Builders", location: "Richmond, VA")
    project_1 = Project.create!(name: "Downtown Library", manager: "Steve")
    item_1 = project_1.items.create!(name: "steel bars", cost: 14000)
    ManufacturerItem.create!(item_id: item_1.id, manufacturer_id: manufacturer_1.id)
    visit "/items/#{item_1.id}"
    expect(page).to have_content("#{item_1.name}")
    expect(page).to have_content("#{item_1.cost}")
  end
  it 'I see the name of the project the item belongs to' do
    manufacturer_1 = Manufacturer.create!(name: "B Builders", location: "Richmond, VA")
    project_1 = Project.create!(name: "Downtown Library", manager: "Steve")
    item_1 = project_1.items.create!(name: "steel bars", cost: 14000)
    ManufacturerItem.create!(item_id: item_1.id, manufacturer_id: manufacturer_1.id)
    visit "/items/#{item_1.id}"
    expect(page).to have_content("#{project_1.name}")
  end

  it 'I see the count of the number of manufacturers for this item' do
    manufacturer_1 = Manufacturer.create!(name: "B Builders", location: "Richmond, VA")
    manufacturer_2 = Manufacturer.create!(name: "C Builders", location: "Henrico, VA")
    project_1 = Project.create!(name: "Downtown Library", manager: "Steve")
    item_1 = project_1.items.create!(name: "steel bars", cost: 14000)
    ManufacturerItem.create!(item_id: item_1.id, manufacturer_id: manufacturer_1.id)
    ManufacturerItem.create!(item_id: item_1.id, manufacturer_id: manufacturer_2.id)
    visit "/items/#{item_1.id}"

    expect(page).to have_content("Manufacturers: 2")
  end
end
