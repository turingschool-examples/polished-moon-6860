require 'rails_helper'

RSpec.describe 'manufacturers index' do
  before :each do
    @project1= Project.create!(name: 'Big Project', manager: 'Timmy')
    @item1 = Item.create!(name: 'Hammer', cost: 11, project_id: @project1.id)
    @item2 = Item.create!(name: 'Nail', cost: 1, project_id: @project1.id)
    @item3 = Item.create!(name: 'Screwdriver', cost: 8, project_id: @project1.id)
    @item4 = Item.create!(name: 'Screw', cost: 2, project_id: @project1.id)
    @item5 = Item.create!(name: 'Measuring Tape', cost: 5, project_id: @project1.id)
    @manufacturer1 = Manufacturer.create!(name: 'Cheap tools', location: 'Chinah')
    @manufacturer2 = Manufacturer.create!(name: 'Quality tools', location: 'Murica')

    @manufacturer_item1 = ManufacturerItem.create!(item: @item1, manufacturer: @manufacturer1)
    @manufacturer_item2 = ManufacturerItem.create!(item: @item2, manufacturer: @manufacturer1)
    @manufacturer_item3 = ManufacturerItem.create!(item: @item3, manufacturer: @manufacturer2)
    @manufacturer_item4 = ManufacturerItem.create!(item: @item4, manufacturer: @manufacturer2)
    @manufacturer_item5 = ManufacturerItem.create!(item: @item5, manufacturer: @manufacturer1)
    @manufacturer_item6 = ManufacturerItem.create!(item: @item5, manufacturer: @manufacturer2)

  end



  it "shows all names of manufacturers" do
    visit "/manufacturers"

    save_and_open_page

    expect(page).to have_content(@manufacturer1.name)
    expect(page).to have_content(@item1.name)
    expect(page).to have_content(@item2.name)
    expect(page).to have_content(@manufacturer2.name)
    expect(page).to have_content(@item3.name)
    expect(page).to have_content(@item4.name)
  end
end
