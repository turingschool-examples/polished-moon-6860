require 'rails_helper'

RSpec.describe "item show page" do
  it "displays the item's name, cost, and associated projects" do
    fence = Project.create!(name: "fence repair", manager: "Bob the Builder")
    hammer = Item.create!(name: "hammer", cost: 3, project_id: fence.id)

    visit "/items/#{hammer.id}"

    expect(page).to have_content("#{hammer.name}")
    expect(page).to have_content("#{hammer.price}")
    expect(page).to have_content("#{fence.name}")
  end
end