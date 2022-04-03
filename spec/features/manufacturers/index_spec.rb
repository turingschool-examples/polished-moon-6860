# As a visitor,
# When I visit the manufacturers index page ("/manufacturers")
# I see a list of names of all the manufacturers
# And under each manufacturers  name I see a list of all of the names of the items they belong to.
require 'rails_helper'

RSpec.describe 'when I visit the manufacturers index page' do
  before do
    @hammer = Manufacturer.create!(name:"Hammers R us", location:"123 Anywhere USA")
    @drill = Manufacturer.create!(name:"Drills R us", location:"123 AnywhereElse USA")

    @project_1 = Project.create!(name:"John House", manager: "Bob")

    @item_1 = @project_1.items.create!(name:"Hammer", cost: 20)
    @item_2 = @project_1.items.create!(name:"Drill", cost:100)

    visit('/manufacturers')
  end
  describe 'display' do
    it 'list all names of manufacturers' do

      expect(current_path).to eq('/manufacturers')
      expect(page).to have_content(@hammer.name)
      expect(page).to have_content(@drill.name)

    end
    it 'each manufacturer name list all names of items' do

    end
  end
end
