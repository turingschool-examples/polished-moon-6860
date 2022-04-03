require "rails_helper"

RSpec.describe "manufacturers index" do
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

  it "lists manufacturer names and item names" do
    vist "/manufacturers"

    expect(page).to have_content("ACME")
    expect(page).to have_content("Offbrand ACME")
    expect(page).to have_content("ACME\nItems: Anvil")
    expect(page).to_not have_content("ACME\nItems: Anvil, Tramploline")
    expect(page).to have_content("Offbrand Acme\nItems: Anvil, Trampoline")
  end
end
