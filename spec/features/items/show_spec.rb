require 'rails_helper'

RSpec.describe "items show page", type: :feature do
  before (:each) do
    @project = Project.create!(name: "Feed the Children", manager: "William")
    @item = @project.items.create!(name: "Coke", cost: "$1")
  end

  describe "when I visit an item's show page" do
    it "shows the item's name and cost" do
      visit "/items/#{@item.id}"
      expect(page).to have_content(@item.name)
      expect(page).to have_content(@item.cost)
      expect(page).to have_content(@project.manager)
    end
  end
end
