require 'rails_helper'

RSpec.describe "item show page" do
  xit "displays the item's name, cost, and associated projects" do
    fence = Project.create!(name: "fence repair", manager: "Bob the Builder")
    hammer = Item.create!(name: "hammer", cost: 3, project_id: fence.id)
    drill = Item.create!(name: "drill", cost: 5, project_id: fence.id)
    boards = Item.create!(name: "boards", cost: 4, project_id: fence.id)

    visit "/projects/#{fence.id}"
    
    expect(page).to have_content("#{fence.average_item_price}")
  end
end
