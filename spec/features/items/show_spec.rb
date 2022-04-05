require 'rails_helper'

RSpec.describe 'the Item show page' do
  before(:each) do
    @project_1 = Project.create!(name: 'Alpha Omega', manager: 'Luke P')

    @manufacturer_1 = Manufacturer.create!(name: 'Metal Customs', location: 'London, UK')
    @manufacturer_2 = Manufacturer.create!(name: 'Earls Fabrication', location: 'Peoria, GA')
    @manufacturer_3 = Manufacturer.create!(name: 'Tech Center One', location: 'Oklahoma City, OK')
    @manufacturer_4 = Manufacturer.create!(name: 'PNW Operators', location: 'Central City, CO')

    @item_1 = @project_1.items.create!(name: 'Adamantium Tube', cost: 743)
    @item_2 = @project_1.items.create!(name: 'Silver Stirrup', cost: 132)
    @item_3 = @project_1.items.create!(name: 'Hex Coil', cost: 42)
    @item_4 = @project_1.items.create!(name: 'Vaulted Strip', cost: 17)
    @item_5 = @project_1.items.create!(name: 'Shoar Visor', cost: 85)
  end

  it 'shows an items name and cost' do
    visit "/items/#{@item_1.id}"

    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_1.cost)
  end

  it 'shows what project the item belongs to' do
    visit "/items/#{@item_1.id}"

    expect(page).to have_content(@project_1.name)
  end

  it 'shows a count of the number of manufacturers for an item' do

    expect(page).to have_content("Total Manufacturers: 4")
  end
end
