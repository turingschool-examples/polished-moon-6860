require 'rails_helper'

RSpec.describe "manufacturers index page" do
  it "displays the manufacturer's name, and associated items" do
    fence = Project.create!(name: "fence repair", manager: "Bob the Builder")
    hammer = Item.create!(name: "hammer", cost: 3, project_id: fence.id)
    drill = Item.create!(name: "drill", cost: 5, project_id: fence.id)
    boards = Item.create!(name: "boards", cost: 4, project_id: fence.id)

    ryobi = Manufacturer.create!(name: "Ryobi", location: "Denver")
    board_maker = Manufacturer.create!(name: "Board Maker", location: "The Forest")

    manufacturer_item1 = ManufacturerItem.create!(manufacturer_id: ryobi.id, item_id: hammer.id)
    manufacturer_item2 = ManufacturerItem.create!(manufacturer_id: ryobi.id, item_id: drill.id)
    manufacturer_item3 = ManufacturerItem.create!(manufacturer_id: board_maker.id, item_id: boards.id)

    visit "/manufacturers"

    expect(page).to have_content("#{ryobi.name}")
    expect(page).to have_content("#{board_maker.name}")

    within "manufacturer-#{ryobi.id}" do
      expect(page).to have_content("#{hammer.name}")
      expect(page).to have_content("#{drill.name}")
      expect(page).to_not have_content("#{board.name}")
    end

    within "manufacturer-#{board_maker.id}" do
      expect(page).to have_content("#{board.name}")
      expect(page).to_not have_content("#{hammer.name}")
      expect(page).to_not have_content("#{drill.name}")
    end
  end
end

# As a visitor,
# When I visit the manufacturers index page ("/manufacturers")
# I see a list of names of all the manufacturers
# And under each manufacturers  name I see a list of all of the names of the items they belong to.