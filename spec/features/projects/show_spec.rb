require 'rails_helper'

RSpec.describe 'projects#show', type: :feature do
  before do
    @manufacturer_3 = Manufacturer.create!(name: 'Manufacturer 3', location: 'Somewhere')
    @manufacturer_6 = Manufacturer.create!(name: 'Manufacturer 6', location: 'Over There')
    @manufacturer_1 = Manufacturer.create!(name: 'Manufacturer 1', location: 'Not Here')

    @project_4 = Project.create(name: 'Project 4', manager: 'Tootoo')
    @item_3 = @project_4.items.create!(name: 'Stick', cost: 22)
    @item_6 = @project_4.items.create!(name: 'Wrench', cost: 35)

    @project_2 = Project.create(name: 'Project 2', manager: 'Bambi')
    @item_16 = @project_2.items.create!(name: 'Ball', cost: 12)
    @item_7 = @project_2.items.create!(name: 'Pipe', cost: 54)

    ManufacturerItem.create!(item_id: @item_3.id, manufacturer_id: @manufacturer_6.id)
    ManufacturerItem.create!(item_id: @item_16.id, manufacturer_id: @manufacturer_3.id)
    ManufacturerItem.create!(item_id: @item_16.id, manufacturer_id: @manufacturer_1.id)
    ManufacturerItem.create!(item_id: @item_7.id, manufacturer_id: @manufacturer_6.id)
    ManufacturerItem.create!(item_id: @item_6.id, manufacturer_id: @manufacturer_1.id)
    ManufacturerItem.create!(item_id: @item_6.id, manufacturer_id: @manufacturer_3.id)

    visit "/projects/#{@project_4.id}"
  end

  it 'shows average cost per item for project' do
    expected = @project4.average_cost
    expect(page).to have_content(expected)
  end
end
