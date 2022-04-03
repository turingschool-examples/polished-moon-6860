require 'rails_helper'

RSpec.describe 'project show page' do

  # User Story Extension 1 - Average cost per item for project
  #
  # As a visitor,
  # When I visit a project's show page
  # I see the average cost per item for the items of that project to two decimal places
  it 'displays the average cost per item for the items of the project, to two decimals' do
    project_1 = Project.create!(name: 'New Summer Toy', manager: 'John Doe')
    item_1 = project_1.items.create!(name: 'Ball', cost: 5)
    item_1 = project_1.items.create!(name: 'Game', cost: 5)
    usa_supply_1 = item_1.manufacturers.create(name: 'Toy Supply Co', location: 'USA')
    mx_supply = item_1.manufacturers.create(name: 'Toys International', location: 'MX')
    # require 'pry'; binding.pry
    # visit "/projects"
    visit "/projects/#{project_1.id}"
    expect(page).to have_content("Average cost: 5")
  end
end
