require 'rails_helper'

RSpec.describe 'item show page' do
  it 'displays that items name and cost' do
    project = Project.create!(name: "Pencil Project", manager: "Billy")
    item = project.items.create!(name: "Pencil", cost: "50")
    item_2 = project.items.create!(name: "Eraser", cost: "25")

    visit "/items/#{item.id}"
    expect(page).to have_content(item.name)
    expect(page).to have_content(item.cost)
    expect(page).to have_content(project.name)
    expect(page).to have_no_content(item_2.name)
  end

  it 'displays item project' do
    project = Project.create!(name: "Pencil Project", manager: "Billy")
    item = project.items.create!(name: "Pencil", cost: "50")
    item_2 = project.items.create!(name: "Eraser", cost: "25")

    visit "/items/#{item.id}"
    expect(page).to have_content(project.name)
  end

  it 'displays a count of manufacturers for item' do
    project = Project.create!(name: "Pencil Project", manager: "Billy")
    item = project.items.create!(name: "Pencil", cost: "50")
    pencil_works = Manufacturer.create!(name: "Pencil Works", location: "China")
    world_of_erasers = Manufacturer.create!(name: "World of Erasers", location: "Africa")
    ManufacturerItem.create!(manufacturer_id: pencil_works.id, item_id: item.id)
    ManufacturerItem.create!(manufacturer_id: world_of_erasers.id, item_id: item.id)

    visit "/items/#{item.id}"
    expect(page).to have_content("Number of Manufacturers: 2")
  end
end
