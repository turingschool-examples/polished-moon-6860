require 'rails_helper'

RSpec.describe 'manufacturers index page' do
  before (:each) do
    @manufacturer1 = Manufacturer.create!(name: "Woody's Furniture", location: "Dallas, TX")
    @manufacturer2 = Manufacturer.create!(name: "Light it Up", location: "Spokane, WA")
    @manufacturer3 = Manufacturer.create!(name: "Drapes n Things", location: "Raleigh, NC")

    @project = Project.create!(name: "New House", manager: "Joe Smith")

    @item1 = @project.items.create!(name: "Dining room table", cost: 478)
    @item2 = @project.items.create!(name: "Coffee table", cost: 230)
    @item3 = @project.items.create!(name: "Blackout curtains", cost: 65)
    @item4 = @project.items.create!(name: "Standing lamp", cost: 55)
    @item5 = @project.items.create!(name: "Hallway runner", cost: 90)

    ManufacturerItem.create!(item: @item1, manufacturer: @manufacturer1)
    ManufacturerItem.create!(item: @item2, manufacturer: @manufacturer1)
    ManufacturerItem.create!(item: @item3, manufacturer: @manufacturer2)
    ManufacturerItem.create!(item: @item4, manufacturer: @manufacturer2)
    ManufacturerItem.create!(item: @item3, manufacturer: @manufacturer3)
    ManufacturerItem.create!(item: @item5, manufacturer: @manufacturer3)
    ManufacturerItem.create!(item: @item2, manufacturer: @manufacturer3)
  end

  it 'has a list of all the manufacturers and their items' do
    visit "/manufacturers"
    Manufacturer.all.each do |man|
      expect(page).to have_content(man.name)
    end

    within "man-#{@manufacturer1.id}" do
      expect(page).to have_content(@item1.name)
      expect(page).to have_content(@item2.name)
      expect(page).not_to have_content(@item3.name)
    end

    within "man-#{@manufacturer3.id}" do
      expect(page).to have_content(@item3.name)
      expect(page).to have_content(@item2.name)
      expect(page).to have_content(@item5.name)
      expect(page).not_to have_content(@item1.name)
    end
  end
end
