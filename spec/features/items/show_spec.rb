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
end
