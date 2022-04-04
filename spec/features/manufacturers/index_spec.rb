require 'rails_helper'

RSpec.describe 'As a visitor' do
  before do
    @manu_1 = Manufacturer.create!(name: 'make it', location: 'colorado')
    @manu_2 = Manufacturer.create!(name: 'have it', location: 'florida')

    @project_1 = Project.create!(name: 'my project', manager: 'john')
    @item_1 = @project_1.items.create!(name: 'product one', cost: 2356)

    @project_2 = Project.create!(name: 'other', manager: 'mary')
    @item_2 = @project_2.items.create!(name: 'something else', cost: 5469)

    @project_3 = Project.create!(name: 'proj3', manager: 'sally')
    @item_3 = @project_3.items.create!(name: 'stuff', cost: 4608)

    @project_4 = Project.create!(name: 'what', manager: 'tom')
    @item_4 = @project_4.items.create!(name: 'goods', cost: 9174)

    ManufacturerItem.create!(manufacturer: @manu_1, item: @item_1)
    ManufacturerItem.create!(manufacturer: @manu_1, item: @item_2)
    ManufacturerItem.create!(manufacturer: @manu_2, item: @item_3)
    ManufacturerItem.create!(manufacturer: @manu_1, item: @item_4)

    visit '/manufacturers'
  end

  describe 'When I visit the manufacturers index page' do
    it 'I see a list of all the manufacturers' do

      expect(page).to have_content("#{@manu_1.name}")
      expect(page).to have_content("#{@manu_2.name}")
    end

    # it 'under each manufacturers name I see a list of all of the names of the items they belong to' do
    #
    #   within "#manufacturers-#{@item_1.id}" do
    #     expect(page).to have_content(@item_1.name)
    #   end
    #   within "#manufacturers-#{@item_2.id}" do
    #     expect(page).to have_content(@item_2.name)
    #   end
    #   within "#manufacturers-#{@item_3.id}" do
    #     expect(page).to have_content(@item_3.name)
    #   end
    #   within "#manufacturers-#{@item_4.id}" do
    #     expect(page).to have_content(@item_4.name)
    #   end
    # end
  end
end