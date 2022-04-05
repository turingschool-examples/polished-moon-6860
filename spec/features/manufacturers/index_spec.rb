require 'rails_helper'

RSpec.describe "manufacturer index page", type: :feature do
  before (:each) do
    @project = Project.create(name: "Yarn Are Us", manager: "Judy")
    @cocacola = Manufacturer.create(name: "Coca-Cola", location: "Alanta")
    @generalmills = Manufacturer.create(name: "General Mills", location: "Minneapolis")
    @coke = @project.items.create(name: "Coke", cost: 1)
    @luckycharms = @project.items.create(name: "Lucky Charms", cost: 5)
    ManufacturerItem.create(manufacturer_id: "#{@cocacola.id}", item_id: "#{@coke.id}")
    ManufacturerItem.create(manufacturer_id: "#{@generalmills.id}", item_id: "#{@luckycharms.id}")
  end
  describe "when I visit the index page" do
    it "shows a list of all manufacturer names" do
      visit "/manufacturers"

      expect(page).to have_content(@cocacola.name)
      expect(page).to have_content(@generalmills.name)
    end

    it "shows all the items they belong to" do
      visit "/manufacturers"

      expect(page).to have_content(@coke.name)
      expect(page).to have_content(@luckycharms.name)
    end
  end
end
