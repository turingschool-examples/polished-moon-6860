# As a visitor,
# When I visit the manufacturers index page ("/manufacturers")
# I see a list of names of all the manufacturers
# And under each manufacturers  name I see a list of all of the names of the items they belong to.
require "rails_helper"

RSpec.describe 'Manufacturers index page' do
  it "contains list of all manufacturers" do
    manufacturer1 = Manufacturer.create!(name: 'ABC corp', location: "Nevada")
    manufacturer2 = Manufacturer.create!(name: 'Apple', location: "Cali")
    manufacturer3 = Manufacturer.create!(name: 'Tickle Me', location: "New Foundland")
    
    project = Project.create!(name: 'newbuild', manager: 'Rick')
    item1 = manufacturer1.items.create!(name: 'thingamabob', cost: 12, project_id:"#{project.id}")
    item2 = manufacturer1.items.create!(name: 'rattle', cost: 76, project_id:"#{project.id}")
    item3 = manufacturer2.items.create!(name: 'doohickey', cost: 34, project_id:"#{project.id}")
    visit "/manufacturers"
    save_and_open_page
    
    expect(page).to have_content(manufacturer1.name)
    expect(page).to have_content(manufacturer2.name)
    expect(page).to have_content(manufacturer3.name)
    
    within("#{manufacturer1.name}") do 
      expect(page).to have_content("thingamabob")
    end 
    
  end
end
