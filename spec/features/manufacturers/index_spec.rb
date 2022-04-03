# As a visitor,
# When I visit the manufacturers index page ("/manufacturers")
# I see a list of names of all the manufacturers
# And under each manufacturers  name I see a list of all of the names of the items they belong to.
require 'rails_helper'

RSpec.describe 'when I visit the manufacturers index page' do
  before do
    @hammer = Manufacturer.create!(name:"Hammers R us", location:"123 Anywhere USA")
    @drill = Manufacturer.create!(name:"Drills R us", location:"123 AnywhereElse USA")

    @project_1 = Project.create!(name:"John House", manager: "Bob")

    @item_1 = @project_1.items.create!(name:"Hammer", cost: 20)
    @item_2 = @project_1.items.create!(name:"Drill", cost:100)
    @item_3 = @project_1.items.create!(name:"Ladder", cost:200)
    @item_4 = @project_1.items.create!(name:"Screwdriver", cost:10)

    @hammer_item1 = ManufacturerItem.create!(item_id: @item_1.id, manufacturer_id: @hammer.id)
    @hammer_item2 = ManufacturerItem.create!(item_id: @item_2.id, manufacturer_id: @hammer.id)
    @hammer_item3 = ManufacturerItem.create!(item_id: @item_3.id, manufacturer_id: @hammer.id)
    @hammer_item4 = ManufacturerItem.create!(item_id: @item_4.id, manufacturer_id: @hammer.id)

    @drill_item1 = ManufacturerItem.create!(item_id: @item_1.id, manufacturer_id: @drill.id)
    visit('/manufacturers')
  end
  describe 'display' do
    it 'list all names of manufacturers' do
        expect(current_path).to eq('/manufacturers')
        expect(page).to have_content(@hammer.name)
        expect(page).to have_content(@drill.name)


    end
    it 'each manufacturer name list all names of items' do
        save_and_open_page
#      within "manufacturer-#{@hammer.id}" do
        expect(page).to have_content(@item_1.name)
        expect(page).to have_content(@item_2.name)
        expect(page).to have_content(@item_3.name)
        expect(page).to have_content(@item_4.name)
#      end

    end
  end
end
