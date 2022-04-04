require 'rails_helper'

RSpec.describe 'item#show', type: :feature do
  it "shows item's name, cost, and project associated with it" do
    project_4 = Project.create(name: 'Project 4', manager: 'Tootoo')
    item_3 = project_4.items.create!(name: 'Stick', cost: 22)

    project_2 = Project.create(name: 'Project 2', manager: 'Bambi')
    item_7 = project_2.items.create!(name: 'Ball', cost: 12)

    visit "/items/#{item_3.id}"

    expect(page).to have_content(item_3.name)
    expect(page).to have_content(item_3.cost)

    expect(page).not_to have_content(item_7.name)
  end
end
