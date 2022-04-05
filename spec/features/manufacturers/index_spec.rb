require 'rails_helper'

RSpec.describe 'manufacturers index page' do
  it 'lists all the manufacturers names' do
    project = Project.create!(name: "Pencil Project", manager: "Billy")
    item = project.items.create!(name: "Pencil", cost: "50")
    item_2 = project.items.create!(name: "Eraser", cost: "25")
    pencil_works = Manufacturer.create!(name: "Pencil Works", location: "China")
    world_of_erasers = Manufacturer.create!(name: "World of Erasers", location: "Africa")
    ManufacturerItem.create!(manufacturer_id: pencil_works.id, item_id: item.id)
    ManufacturerItem.create!(manufacturer_id: world_of_erasers.id, item_id: item_2.id)

    visit "/manufacturers"
    expect(page).to have_content(pencil_works.name)
    expect(page).to have_content(world_of_erasers.name)
  end
end
