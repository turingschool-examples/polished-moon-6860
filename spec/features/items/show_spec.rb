require "rails_helper"

RSpec.describe "items show" do
  before :each do
    @project = Project.create!(name: "Eat Road Runner", manager: "Wile E. Coyote")
    @item_1 = @project.items.create!(name: "Anvil", cost: 200)
    @item_2 = @project.items.create!(name: "Trampoline", cost: 800)

    @acme = Manufacturer.create!(name: "ACME", location: "Toonville USA")
    @offbrand = Manufacturer.create!(name: "Offbrand ACME", location: "Worseville USA")

    @item_1.manufacturers << @acme
    @item_2.manufacturers << @acme
    @item_2.manufacturers << @offbrand
  end

  it "shows item name and cost" do
    visit "/items/#{@item_1.id}"
    # save_and_open_page
    expect(page).to have_content("Anvil")
    expect(page).to have_content("200")
    expect(page).to have_content("Eat Road Runner")
  end

  it "shows number of manufacturers for this item" do
    visit "/items/#{@item_1.id}"
    # save_and_open_page
    expect(page).to have_content("Number of Manufacturers: 2")

    visit "/items/#{@item_2.id}"

    expect(page).to have_content("Number of Manufacturers: 1")
  end
end
