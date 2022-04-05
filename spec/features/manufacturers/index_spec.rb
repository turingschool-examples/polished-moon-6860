require 'rails_helper'

RSpec.describe 'the manufacturer index' do
  it "shows the manufacturer and their associated items" do
    project = Project.create!(name: 'Project1', manager: 'Cory')
    item = project.items.create!(name: 'Paper', cost: 2)
    manu = Manufacturer.create!(name: 'Broadcom', location: 'CO')
    manufact_item = ManufacturerItem.create!(manufacturer_id: manu.id, item_id: item.id)

    visit '/manufacturers'

    expect(page).to have_content(manu.name)
    expect(page).to have_content(item.name)
  end
  
end
