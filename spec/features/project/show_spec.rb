require "rails_helper"

RSpec.describe "Project show page", type: :feature do
  let!(:estuff) { Project.create!(name: "eStuff", manager: "Jim Cook") }
  let!(:ephone) { Item.create!(name: "ePhone", cost: 900, project_id: estuff.id) }
  let!(:epad) { Item.create!(name: "ePad", cost: 400, project_id: estuff.id) }

  it "lists average price of items in project" do
    visit "/projects/#{estuff.id}"

    expect(page).to have_content("650")
  end
end
