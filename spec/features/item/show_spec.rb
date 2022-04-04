require 'rails_helper'

RSpec.describe 'item show' do
  before :each do
    @manufacturer1 = Manufacturer.create!(name: "Pabus shop", location: "Ferret land")
    @manufacturer2 = Manufacturer.create!(name: "Pabus warehouse", location: "Ferret factory")
    @project = Project.create!(name: "Pabus Ferret Shop", manager: "Pabu")
    @item1 = @project.items.create!(name: "Shampoo", cost: 20)
    visit "/items/#{@item1.id}"
  end

  describe 'item show page' do
    it 'shows items attributes' do
      expect(page).to have_content("Items attributes:")
      expect(page).to have_content(@item1.name)
      expect(page).to have_content(@item1.cost)
      expect(page).to have_content("Item's project name:")
      expect(page).to have_content(@project.name)
    end
    it 'shows count of manufacturers' do
      within("#manufacturer-count") do
        expect(page).to have_content("Manufacturer count:")
        expect(page).to have_content(2)
      end
    end
  end
end
