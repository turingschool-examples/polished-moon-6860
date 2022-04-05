require 'rails_helper'

RSpec.describe 'Item Show Page' do
  it "displays the items name and cost along with name of project it belongs to" do
    project = Project.create!(name: "New Tech", manager: "Mike Dao")
    item = Item.create!(name: "Laptop", cost: 250, project_id: project.id)

    visit "/items/#{item.id}"

    expect(page).to have_content(item.name)
    expect(page).to have_content(item.cost)
    expect(page).to have_content(item.project.name)
  end
end
