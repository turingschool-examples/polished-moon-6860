require 'rails_helper'

describe 'Item Show Page' do
  before do
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
    @item_2 = @project_2.items.create!(
      name: "Lame Item",
      cost: 1
    )

    @manny_1 = Manufacturer.create!(
      name: "Manny Won",
      location: "The World"
    )
    @manny_2 = Manufacturer.create!(
      name: "Manny Won",
      location: "The World"
    )

    ManufacturerItem.create!(item_id: @item_2.id, manufacturer_id: @manny_1.id)
    ManufacturerItem.create!(item_id: @item_2.id, manufacturer_id: @manny_2.id)

    visit("/items/#{@item_2.id}")
  end

  it 'shows the items name and cost' do
    expect(page).to have_content(@item_2.name)
    expect(page).to have_content(@item_2.cost)

    expect(page).not_to have_content(@item_1.name)
  end

  it 'shows the project this item belongs to' do
    expect(page).to have_content(@project_2.name)
  end

  it 'shows the count of the number of manufacturers for this item' do
    expect(page).to have_content("Manufactureres: 2")
  end
end
