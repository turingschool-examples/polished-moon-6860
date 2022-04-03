require "rails_helper"

RSpec.describe "Item show page", type: :feature do
  let!(:e_stuff) { Project.create!(name: "e_stuff", manager: "Jim Cook") }
  let!(:ephone) { Item.create!(name: "ePhone", cost: 900, project_id: e_stuff.id) }
  # let!(:epad) { Item.create!(name: "ePad", cost: 500, project_id: e_stuff.id) }

  it "lists item name/cost/project" do
    visit "/items/#{ephone.id}"

    expect(page).to have_content(ephone.name)
    expect(page).to have_content(ephone.cost)
    # expect(page).to have_content(ephone.#project name)
  end
end
