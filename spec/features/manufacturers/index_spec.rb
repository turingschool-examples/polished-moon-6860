require 'rails_helper'

describe 'Manufacturer Index Page' do
  before do
    @manny_1 = Manufacturer.create!(
      name: "Manny Won",
      location: "The World"
    )
    @manny_2 = Manufacturer.create!(
      name: "Manneetoo",
      location: "Their World"
    )
    @manny_3 = Manufacturer.create!(
      name: "Mannthree",
      location: "Not The World"
    )

    @project_1 = Project.create!(
      name: "Awesome Project",
      manager: "Mark Awesome"
    )
    @project_2 = Project.create!(
      name: "Lame Project",
      manager: "Michael Lame"
    )

    @item_1 = @project_1.items.create!(
      name: "Awesome Item",
      cost: 99
    )
    @item_2 = @project_1.items.create!(
      name: "Super Awesome Item",
      cost: 99
    )
    @item_3 = @project_2.items.create!(
      name: "Lame Item",
      cost: 1
    )
    @item_4 = @project_2.items.create!(
      name: "The Awesomest Item",
      cost: 999
    )

    ManufacturerItem.create!(item_id: @item_1.id, manufacturer_id: @manny_1.id)
    ManufacturerItem.create!(item_id: @item_2.id, manufacturer_id: @manny_1.id)
    ManufacturerItem.create!(item_id: @item_3.id, manufacturer_id: @manny_2.id)
    ManufacturerItem.create!(item_id: @item_4.id, manufacturer_id: @manny_2.id)

    visit "/manufacturers"
  end

  it 'lists the names of all the manufacturers' do
    expect(page).to have_content(@manny_1.name)
    expect(page).to have_content(@manny_2.name)
    expect(page).to have_content(@manny_3.name)
  end

  it 'lists the names of each of the items they belong to' do
    within "#manufacturer-#{@manny_1.id}" do
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_2.name)
      expect(page).not_to have_content(@item_3.name)
      expect(page).not_to have_content(@item_4.name)
    end

    within "#manufacturer-#{@manny_2.id}" do
      expect(page).to have_content(@item_3.name)
      expect(page).to have_content(@item_4.name)
      expect(page).not_to have_content(@item_1.name)
      expect(page).not_to have_content(@item_2.name)
    end
  end
end
