# As a visitor,
# When I visit an item's show page ("/items/:id"),
# I see that item's name and cost
# And I also see the name of the project this belongs to.
require 'rails_helper'

RSpec.describe 'when i visit an items show page'do

  before do

    @project_1 = Project.create!(name:"John House", manager: "Bob")

    @item_1 = @project_1.items.create!(name:"Hammer", cost: 20)
    @item_2 = @project_1.items.create!(name:"Drill", cost:100)


  visit "/items/#{@item_1.id}"
  end

  describe 'display' do
    it 'item name, cost and project item belongs to' do

      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.cost)
      expect(page).to have_content(@project_1.name)
# save_and_open_page
    end
  end
end
