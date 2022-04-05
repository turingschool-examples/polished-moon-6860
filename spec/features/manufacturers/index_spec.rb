require "rails_helper"

RSpec.describe "Manufacturers Index Page" do
  it "displays names of all Manufacturers and Items they belong to" do
    project1 = Project.create!(name: "New Tech", manager: "Mike Dao")
    item1 = Item.create!(name: "Laptop", cost: 250, project_id: project1.id)
    manufacturer1 = item1.manufacturers.create!(name: "Widget Maker", location: "Phoenix")
    manufacturer2 = item1.manufacturers.create!(name: "Gear Heads", location: "Sacramento")

    project2 = Project.create!(name: "Old Tech", manager: "Dani Coleman")
    item2 = Item.create!(name: "Tablet", cost: 175, project_id: project2.id)
    manufacturer3 = item2.manufacturers.create!(name: "Weavers", location: "Chicago")
    manufacturer4 = item2.manufacturers.create!(name: "Tech Stars", location: "Denver")

    visit "/manufacturers"

    expect(page).to have_content(manufacturer1.name)
    expect(page).to have_content("Laptop")
    expect(page).to have_content(manufacturer2.name)
    expect(page).to have_content("Laptop")
    expect(page).to have_content(manufacturer3.name)
    expect(page).to have_content("Tablet")
    expect(page).to have_content(manufacturer4.name)
    expect(page).to have_content("Tablet")
  end
end
