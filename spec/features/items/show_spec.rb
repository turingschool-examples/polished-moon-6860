require 'rails_helper'

RSpec.describe "items show page", type: :feature do
  before (:each) do
    @project = Project.create!(name: "Feed the Children", manager: "William")
    @item = @project.items.create!(name: "Chair", cost: 100)
    @afw = Manufacturer.create(name: "AFW", location: "Denver")
    @sd = Manufacturer.create(name: "Scandinavian Designs", location: "Denver")
    ManufacturerItem.create(manufacturer_id: @afw.id, item_id: @item.id)
    ManufacturerItem.create(manufacturer_id: @sd.id, item_id: @item.id)
  end

  describe "when I visit an item's show page" do
    it "shows the item's name and cost" do
      visit "/items/#{@item.id}"
      expect(page).to have_content(@item.name)
      expect(page).to have_content(@item.cost)
      expect(page).to have_content(@project.manager)
    end

    it "shows the number of manufacturers for this item" do
      visit "items/#{@item.id}"
      expect(page).to have_content("2")
    end
  end
end
