require 'rails_helper'

RSpec.describe "Item Show Page", type: :feature do

  before :each do
    @project_1 = Project.create!(name: "Haven Games Project", manager: "Zel")
    @item_1 = Item.create!(name: "Gloomhaven", cost: 149, project_id: @project_1.id)
    @item_2 = Item.create!(name: "Frosthaven", cost: 149, project_id: @project_1.id)
    @manufacturer_1 = Manufacturer.create!(name: "Cephalofair Games", location: "Lafayette, IN")
    @manufacturer_2 = Manufacturer.create!(name: "Tabletop Simulator", location: "The Internet")
    @manufacturer_item_1 = ManufacturerItem.create!(item_id: @item_1.id, manufacturer_id: @manufacturer_1.id)
    @manufacturer_item_2 = ManufacturerItem.create!(item_id: @item_2.id, manufacturer_id: @manufacturer_1.id)
    @manufacturer_item_3 = ManufacturerItem.create!(item_id: @item_1.id, manufacturer_id: @manufacturer_2.id)
  end

  it "shows individual items and their project's name" do
    visit "/items/#{@item_1.id}"

    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_1.cost)
    expect(page).to have_content(@project_1.name)
  end

  it 'displays a count of manufacturers distributing the item' do
    visit "/items/#{@item_2.id}"

    expect(page).to have_content("Manufacturer Count: #{@item_2.manufacturers.count}")
  end
end
