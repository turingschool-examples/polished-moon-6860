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
