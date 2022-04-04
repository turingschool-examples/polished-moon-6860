require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the projects show page' do
    it 'I see the average cost per item for the items of that project to two decimal places' do

      @manu_1 = Manufacturer.create!(name: 'make it', location: 'colorado')

      @project_1 = Project.create!(name: 'my project', manager: 'john')
      @item_1 = @project_1.items.create!(name: 'product one', cost: 2356)
      @item_2 = @project_1.items.create!(name: 'different', cost: 5434)

      ManufacturerItem.create!(manufacturer: @manu_1, item: @item_1)

      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Average Cost Per Item: 38.95")
    end
  end
end