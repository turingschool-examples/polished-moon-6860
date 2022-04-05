require "rails_helper"

RSpec.describe 'Item show page' do
  it "contains item name and costs" do
    project = Project.create!(name: 'newbuild', manager: 'Rick')
    item = project.items.create!(name: 'thingamabob', cost: 12)
    visit "/items/#{item.id}"
    
    expect(page).to have_content("#{item.name}")
    expect(page).to have_content("#{item.cost}")
  end
  
  it "has the number of manufacturers associated" do
    project = Project.create!(name: 'newbuild', manager: 'Rick')
    item1 = Item.create!(name: 'thingamabob', cost: 12, project_id:"#{project.id}")
    item2 = Item.create!(name: 'rattle', cost: 76, project_id:"#{project.id}")
    
    manufacturer1 = item1.manufacturers.create!(name: 'ABC corp', location: "Nevada")
    manufacturer2 = item1.manufacturers.create!(name: 'Apple', location: "Cali")
    manufacturer3 = item2.manufacturers.create!(name: 'Tickle Me', location: "New Foundland")
    visit "/items/#{item1.id}"
    expect(page).to have_content("Number of Manufacturers: 2")
    
    visit "/items/#{item2.id}"
    expect(page).to have_content("Number of Manufacturers: 1")
  end
end
