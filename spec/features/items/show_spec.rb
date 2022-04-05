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
end
