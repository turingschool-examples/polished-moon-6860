require "rails_helper"

RSpec.describe "Manufacturers index page", type: :feature do
  let!(:estuff) { Project.create!(name: "eStuff", manager: "Jim Cook") }
  let!(:ephone) { Item.create!(name: "ePhone", cost: 900, project_id: estuff.id) }
  let!(:epad) { Item.create!(name: "ePad", cost: 400, project_id: estuff.id) }
  let!(:fexcamm) { Manufacturer.create!(name: "FexCamm", location: "Wisconsin") }
  let!(:tegatron) { Manufacturer.create!(name: "Tegatron", location: "Taiwan") }
  let!(:man_item_1) { ManufacturerItem.create!(item_id: ephone.id, manufacturer_id: fexcamm.id) }
  let!(:man_item_2) { ManufacturerItem.create!(item_id: ephone.id, manufacturer_id: tegatron.id) }
  let!(:man_item_2) { ManufacturerItem.create!(item_id: epad.id, manufacturer_id: tegatron.id) }

  it "lists item name/cost/ associated projects" do
    visit "/manufacturers"

    expect(page).to have_content("FexCamm")
    expect(page).to have_content("Tegatron")

    within "[data-id=#{fexcamm.id}]" do
      expect(page).to have_content("ePhone")
    end

    within "[data-id=#{tegatron.id}]" do
      expect(page).to have_content("ePhone")
      expect(page).to have_content("ePad")
    end
  end
end
