require 'rails_helper'

RSpec.describe 'Items#show page' do
  before :each do
    @project = Project.create!(name: "Create Life", manager: "Dr. Frankenstein")
    @item = @project.items.create!(name: "Monster", cost: 1000)

    visit "/items/#{@item.id}"
  end

  it 'shows the item name, cost, and project it belongs to' do
    expect(page).to have_content(@item.name)
    expect(page).to have_content(@item.cost)
    expect(page).to have_content(@project.name)
  end
end
