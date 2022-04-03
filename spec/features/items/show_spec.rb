require 'rails_helper'


RSpec.describe 'Item Show page' do
  it 'displays items name, cost and project owner' do
    project = Project.create!(name: 'Build4Kids', manager: 'Joe')
    item = project.items.create!(name: 'School', cost: '500')

    visit "/items/#{item.id}"

    expect(page).to have_content('School')
    expect(page).to have_content('500')
    expect(page).to have_content('Build4Kids')
  end

  it 'displays items name, cost and project owner' do
    project = Project.create!(name: 'Build4Kids', manager: 'Joe')
    item1 = project.items.create!(name: 'CPU', cost: '100')
    item2 = project.items.create!(name: 'RAM', cost: '50')
    item3 = project.items.create!(name: 'HardDrive', cost: '10')
    item4 = project.items.create!(name: 'SSD', cost: '10')
    item5 = project.items.create!(name: 'HDMI', cost: '5')
    manufacturer_1 = Manufacturer.create!(name: 'Apple', location: 'China')
    manufacturer_2 = Manufacturer.create!(name: 'IBM', location: 'USA')
    manufacturer_3 = Manufacturer.create!(name: 'Microsoft', location: 'Germany')
    manufacturer_item_1 = ManufacturerItem.create!(manufacturer_id: manufacturer_1.id, item_id: item1.id)
    manufacturer_item_1 = ManufacturerItem.create!(manufacturer_id: manufacturer_2.id, item_id: item1.id)
    manufacturer_item_1 = ManufacturerItem.create!(manufacturer_id: manufacturer_3.id, item_id: item1.id)
    manufacturer_item_2 = ManufacturerItem.create!(manufacturer_id: manufacturer_1.id, item_id: item2.id)
    manufacturer_item_3 = ManufacturerItem.create!(manufacturer_id: manufacturer_2.id, item_id: item2.id)
    manufacturer_item_4 = ManufacturerItem.create!(manufacturer_id: manufacturer_2.id, item_id: item4.id)
    manufacturer_item_5 = ManufacturerItem.create!(manufacturer_id: manufacturer_3.id, item_id: item5.id)

    visit "/items/#{item1.id}"
    expect(page).to have_content('Number of Manufacturers: 3')
    visit "/items/#{item2.id}"
    expect(page).to have_content('Number of Manufacturers: 2')
    visit "/items/#{item5.id}"
    expect(page).to have_content('Number of Manufacturers: 1')
  end
end
