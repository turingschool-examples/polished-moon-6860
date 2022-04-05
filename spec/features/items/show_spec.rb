require 'rails_helper'

RSpec.describe 'the application show' do

  it "shows the item and its attributes" do
    project = Project.create!(name: 'Project1', manager: 'Cory')
    item = project.items.create!(name: 'Paper', cost: 2)
    manu = Manufacturer.create!(name: 'Broadcom', location: 'CO')
    manufact_item = ManufacturerItem.create!(manufacturer_id: manu.id, item_id: item.id)

    visit "items/#{item.id}"

    expect(page).to have_content(item.name)
    expect(page).to have_content(item.cost)
    expect(page).to have_content(project.name)
  end

  it "displays the amount of manufacturers associated with the item" do
    project = Project.create!(name: 'Project1', manager: 'Cory')
    item = project.items.create!(name: 'Paper', cost: 2)
    manu = Manufacturer.create!(name: 'Broadcom', location: 'CO')
    manufact_item = ManufacturerItem.create!(manufacturer_id: manu.id, item_id: item.id)
    manu2 = Manufacturer.create!(name: 'Intel', location: 'CA')
    ManufacturerItem.create!(manufacturer_id: manu2.id, item_id: item.id)

    visit "items/#{item.id}"

    expect(page).to have_content("This item is manufactured by 2 companies.")


  end

end
