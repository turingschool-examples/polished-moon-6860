require "rails_helper"

RSpec.describe "Item show page", type: :feature do
  let!(:estuff) { Project.create!(name: "eStuff", manager: "Jim Cook") }
  let!(:ephone) { Item.create!(name: "ePhone", cost: 900, project_id: estuff.id) }

  it "lists item name/cost/project" do
    visit "/items/#{ephone.id}"

    expect(page).to have_content("ePhone")
    expect(page).to have_content("900")
    expect(page).to have_content("eStuff")
  end
end
