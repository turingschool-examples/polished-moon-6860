require "rails_helper"

RSpec.describe "Item show page", type: :feature do
  let!(:estuff) { Project.create!(name: "eStuff", manager: "Jim Cook") }
  let!(:ephone) { Item.create!(name: "ePhone", cost: 900, project_id: estuff.id) }
  let!(:fexcamm) { Manufacturer.create!(name: "FexCamm", location: "Wisconsin") }
  let!(:tegatron) { Manufacturer.create!(name: "Tegatron", location: "Taiwan") }
  let!(:man_item_1) { ManufacturerItem.create!(item_id: ephone.id, manufacturer_id: fexcamm.id) }
  let!(:man_item_2) { ManufacturerItem.create!(item_id: ephone.id, manufacturer_id: tegatron.id) }

  it "lists item name/cost/project" do
    visit "/items/#{ephone.id}"

    expect(page).to have_content("ePhone")
    expect(page).to have_content("900")
    expect(page).to have_content("eStuff")
    expect(page).to have_content("2")
  end
end
