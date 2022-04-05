require "rails_helper"

RSpec.describe "items show page" do
  it "displays the item name cost and projects" do
    wood_floor = Project.create!(name: "floor repair", manager: "Gary")
    sander = Item.create!(name: "sander", cost: 4, project_id: wood_floor.id)

    visit "/items/#{sander.id}"

    expect(page).to have_content(sander.id.to_s)
    expect(page).to have_content(sander.price.to_s)
    expect(page).to have_content(sander.name.to_s)
  end
end
