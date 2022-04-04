require 'rails_helper'

RSpec.describe 'As a visitor' do
  before do

    @manu_1 = Manufacturer.create!(name: 'make it', location: 'colorado')
    @manu_2 = Manufacturer.create!(name: 'have it', location: 'florida')

    @project_1 = Project.create!(name: 'my project', manager: 'john')
    @item_1 = @project_1.items.create!(name: 'product one', cost: 2356)

    ManufacturerItem.create!(manufacturer: @manu_1, item: @item_1)
    ManufacturerItem.create!(manufacturer: @manu_2, item: @item_1)


    visit "/items/#{@item_1.id}"
  end
  describe 'When I visit the items show page' do
    it 'I see that items name and cost' do

      expect(page).to have_content("#{@item_1.name}")
      expect(page).to have_content("#{@item_1.cost}")
    end

    it 'I also see the name of project this belongs to' do

      expect(page).to have_content("#{@project_1.name}")
    end

    it 'I see a count of the number of manufacturers for this item' do

      expect(page).to have_content("Number of Manufacturers For This Item: 2")
    end
  end
end