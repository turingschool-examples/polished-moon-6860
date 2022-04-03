require 'rails_helper'

RSpec.describe 'Items#show page' do
  before :each do
    @project = Project.create!(name: "Create Life", manager: "Dr. Frankenstein")

    @monster = @project.items.create!(name: "Monster", cost: 1000)
    @lab = @monster.manufacturers.create!(name: "Frankenstein's Lab", location: "Ingolstadt, Germany")
    @graveyard = @monster.manufacturers.create!(name: "Ingolstadt Graveyard", location: "Ingolstadt, Germany")
    @storm = @monster.manufacturers.create!(name: "Lightning Storm", location: "Europe")

    visit "/items/#{@monster.id}"
  end

  it 'shows the item name, cost, and project it belongs to' do
    expect(page).to have_content(@monster.name)
    expect(page).to have_content(@monster.cost)
    expect(page).to have_content(@project.name)
  end

  it 'shows the count of manufacturers associated with the item' do
    expect(page).to have_content("Number of Manufacturers: 3")
  end
end
