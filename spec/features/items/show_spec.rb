require 'rails_helper'

RSpec.describe 'the item show' do
  it "shows the item and all it's attributes" do
    project = Project.create!(name: "Lazer Makers", manager: "Mike Dao")
    item = project.items.create!(name: "Big Ass Lazer", cost: "12345")
    visit "/items/#{item.id}"
    expect(page).to have_content("Big Ass Lazer")
    expect(page).to have_content("12345")
    expect(page).to have_content("Lazer Makers")

  end

  it "shows the item number of manufacturers" do
    project = Project.create!(name: "Lazer Makers", manager: "Mike Dao")
    item1 = project.items.create!(name: "Big Ass Lazer", cost: "12345")
    manufacturer1 = Manufacturer.create!(name: 'Wizards of the Coast', location: 'Seattle')
    manufacturer2 = Manufacturer.create!(name: 'Ben and Jerrys', location: 'Baulders Gate')
    manufacturer_item1 = ManufacturerItem.create!(manufacturer_id: manufacturer1.id, item_id: item1.id )
    manufacturer_item2 = ManufacturerItem.create!(manufacturer_id: manufacturer2.id, item_id: item1.id )
    visit "/items/#{item1.id}"
    expect(page).to have_content("2")

  end
end
