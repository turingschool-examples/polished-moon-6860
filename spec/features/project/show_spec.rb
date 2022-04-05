require 'rails_helper'

RSpec.describe 'the project show page' do
  it 'displays the average item cost to two decimal places' do
    manufacturer_1 = Manufacturer.create!(name: "B Builders", location: "Richmond, VA")
    manufacturer_2 = Manufacturer.create!(name: "C Builders", location: "Henrico, VA")
    project_1 = Project.create!(name: "Downtown Library", manager: "Steve")
    item_1 = project_1.items.create!(name: "steel bars", cost: 14000)
    item_2 = project_1.items.create!(name: "cinder blocks", cost: 100)
    ManufacturerItem.create!(item_id: item_1.id, manufacturer_id: manufacturer_1.id)
    ManufacturerItem.create!(item_id: item_1.id, manufacturer_id: manufacturer_2.id)
    visit "/projects/#{project_1.id}"
save_and_open_page
    expect(page).to have_content("Average item cost: 7050.00")
  end
end
