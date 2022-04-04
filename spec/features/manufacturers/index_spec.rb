require 'rails_helper'

RSpec.describe 'Manufacturer Index page' do 
 before :each do 
    @project_1 = Project.create!(name: "Nicer Things", manager: "Kim G")
    @item_1 = @project_1.items.create!(name: "Nintendo Switch", cost: 349)
    @item_2 = @project_1.items.create!(name: "Nintendo Switch2", cost: 349)
    @item_3 = @project_1.items.create!(name: "Lululemon Women's Golf Shirt", cost: 68)
    @item_4 = @project_1.items.create!(name: "Lululemon Men's on the Move Pants", cost: 128)
    @manufacturer_1 = Manufacturer.create!(name: "Nintendo", location: "Japan")
    @manufacturer_2 = Manufacturer.create!(name: "Lululemon", location: "Canada")
 	@manufacturer_item_1 = ManufacturerItem.create!(manufacturer: @manufacturer_1, item: @item_1)
 	@manufacturer_item_2 = ManufacturerItem.create!(manufacturer: @manufacturer_1, item: @item_2)
 	@manufacturer_item_3 = ManufacturerItem.create!(manufacturer: @manufacturer_2, item: @item_3)
 	@manufacturer_item_4 = ManufacturerItem.create!(manufacturer: @manufacturer_2, item: @item_4)

  end


	it 'lists names of all Manufacturers and their items' do 
		visit '/manufacturers'

		within("#Manufacturer-#{@manufacturer_1.id}") do 
			expect(page).to have_content(@manufacturer_1.name)
			expect(page).to have_content(@item_1.name)
			expect(page).to have_content(@item_2.name)
			expect(page).to_not have_content(@item_3.name)
			expect(page).to_not have_content(@item_4.name)


		end
		within("#Manufacturer-#{@manufacturer_2.id}") do 
			expect(page).to have_content(@manufacturer_2.name)
			expect(page).to have_content(@item_3.name)
			expect(page).to have_content(@item_4.name)
			expect(page).to_not have_content(@item_1.name)
			expect(page).to_not have_content(@item_2.name)


		end

	end


end