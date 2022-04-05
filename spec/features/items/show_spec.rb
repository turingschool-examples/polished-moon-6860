# As a visitor,
# When I visit an item's show page ("/items/:id"),
# I see that item's name and cost
# And I also see the name of the project this belongs to.
require "rails_helper"
RSpec.describe 'Item show page' do
  it "contains item name and costs" do
    project = Project.create!(name: 'newbuild', manager: 'Rick')
    item = project.items.create!(name: 'thingamabob', cost: 12)
    visit "/items/#{item.id}"
    
    expect(page).to have_content("#{item.name}")
    expect(page).to have_content("#{item.cost}")
    
  end
end
