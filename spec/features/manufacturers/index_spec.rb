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
    item1 = project.items.create!(name: 'thingamabob', cost: 12)
    item2 = project.items.create!(name: 'rattle', cost: 76)
    item3 = project.items.create!(name: 'doohickey', cost: 34)

    visit "/manufacturers"
    
    expect(page).to have_content(manufacturer1.name, manufacturer2.name, manufacturer3.name)
    expect("thingamabob").to appear_before('doohickey')
  end
end
