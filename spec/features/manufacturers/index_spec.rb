require 'rails_helper'

RSpec.describe 'the manufacturers index' do

  it 'lists all the manufacturers and their items' do
    project = Project.create!(name: "Lazer Makers", manager: "Mike Dao")
    manufacturer1 = Manufacturer.create!(name: 'Wizards of the Coast', location: 'Seattle')
    manufacturer2 = Manufacturer.create!(name: 'Ben and Jerrys', location: 'Baulders Gate')
    item1 = project.items.create!(name:'Magic Booster', cost: '4' )
    item2 = project.items.create!(name:'DND Core Rulebook', cost: '30' )
    item3 = project.items.create!(name:'Chocoalate', cost: '6' )
    item4 = project.items.create!(name:'Vanilla', cost: '6' )
    manufacturer_item1 = ManufacturerItem.create!(manufacturer_id: manufacturer1.id, item_id: item1.id )
    manufacturer_item2 = ManufacturerItem.create!(manufacturer_id: manufacturer1.id, item_id: item2.id )
    manufacturer_item3 = ManufacturerItem.create!(manufacturer_id: manufacturer2.id, item_id: item3.id )
    manufacturer_item4 = ManufacturerItem.create!(manufacturer_id: manufacturer2.id, item_id: item4.id )
    visit "/manufacturers/"

    expect(page).to have_content(manufacturer1.name)
    expect(page).to have_content(manufacturer2.name)
    expect(page).to have_content(item1.name)
    expect(page).to have_content(item2.name)
    expect(page).to have_content(item3.name)
    expect(page).to have_content(item4.name)

  end

end
