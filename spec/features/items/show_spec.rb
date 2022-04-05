require "rails_helper"

RSpec.describe "Item Show Page" do
  it "displays the items name and cost along with name of project it belongs to" do
    project = Project.create!(name: "New Tech", manager: "Mike Dao")
    item = Item.create!(name: "Laptop", cost: 250, project_id: project.id)

    visit "/items/#{item.id}"

    expect(page).to have_content(item.name)
    expect(page).to have_content(item.cost)
    expect(page).to have_content(item.project.name)
  end

  it "displays the count of number of manufacturers for this item" do
    project1 = Project.create!(name: "New Tech", manager: "Mike Dao")
    item1 = Item.create!(name: "Laptop", cost: 250, project_id: project1.id)
    manufacturer1 = item1.manufacturers.create!(name: "Widget Maker", location: "Phoenix")
    manufacturer2 = item1.manufacturers.create!(name: "Gear Heads", location: "Sacramento")
    manufacturer3 = item1.manufacturers.create!(name: "Weavers", location: "Chicago")

    visit "/items/#{item1.id}"

    expect(page).to have_content(item1.manufacturers.count)
  end
end
