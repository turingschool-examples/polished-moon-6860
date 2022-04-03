require 'rails_helper'

RSpec.describe 'item show page', type: :feature do
  it 'displays the items name and cost and project it belongs to' do
    project_1 = Project.create!(name: 'New Summer Toy', manager: 'John Doe')
    item_1 = project_1.items.create!(name: 'Ball', cost: 5)
    visit "/items/#{item_1.id}"
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.cost)
    expect(page).to have_content(project_1.name)
  end
  
  it 'displays a count of the number of manufacturers for the item' do
    project_1 = Project.create!(name: 'New Summer Toy', manager: 'John Doe')
    item_1 = project_1.items.create!(name: 'Ball', cost: 5)
    usa_supply_1 = item_1.manufacturers.create(name: 'Toy Supply Co', location: 'USA')
    mx_supply = item_1.manufacturers.create(name: 'Toys International', location: 'MX')
    visit "items/#{item_1.id}"
    expect(page).to have_content('Number of manufacturers: 2')
  end
end
