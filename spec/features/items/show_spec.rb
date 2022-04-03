require 'rails_helper'
# User Story 1 of 3
#
# As a visitor,
# When I visit an item's show page ("/items/:id"),
# I see that item's name and cost
# And I also see the name of the project this belongs to.

RSpec.describe 'item show page', type: :feature do
  it 'displays the items name and cost and project it belongs to' do
    project_1 = Project.create!(name: 'New Summer Toy', manager: 'John Doe')
    item_1 = project_1.create!(name: 'Ball', cost: 5)
    visit "/items/#{item.id}"
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.cost)
    expect(page).to have_content(project_1.name)
  end
end
