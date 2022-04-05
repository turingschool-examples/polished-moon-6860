require "rails_helper"

RSpec.describe "items show page" do
  before :each do
    it "displays the item name cost and projects" do
      @wood_floor = Project.create!(name: "floor repair", manager: "Gary")
      @sander = @wood_floor.items.create!(name: "sander", cost: 4)
    end

    it "displays item name and cost"
    visit "/items/#{@sander.id}"

    expect(page).to have_content("sander")
    expect(page).to have_content("4")
    expect(page).to have_content("floor repair")
  end
end
