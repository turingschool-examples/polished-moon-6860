require 'rails_helper'

RSpec.describe 'the manufacturer index page' do
  it 'I see a list of names of all the manufacturers and under each manufacturer name I see a list of all of the names of the items they belong to' do
    manufacturer_1 = Manufacturer.create!(name: "B Builders", location: "Richmond, VA")
    project_1 = Project.create!(name: "Downtown Library", manager: "Steve")
    item_1 = project_1.items.create!(name: "steel bars", cost: 14000)

    manufacturer_2 = Manufacturer.create!(name: "C Builders", location: "Henrico, VA")
    project_2 = Project.create!(name: "County Rec Center", manager: "Dave")
    item_2 = project_2.items.create!(name: "cinder blocks", cost: 12000)

    ManufacturerItem.create!(item_id: item_1.id, manufacturer_id: manufacturer_1.id)
    ManufacturerItem.create!(item_id: item_2.id, manufacturer_id: manufacturer_2.id)

    visit '/manufacturers'
    expect(page).to have_content(manufacturer_1.name)
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(manufacturer_2.name)
    expect(page).to have_content(item_2.name)
  end
end
