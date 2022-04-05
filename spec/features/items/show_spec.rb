require 'rails_helper'

RSpec.describe "Item Show Page", type: :feature do

  before :each do
    @project_1 = Project.create!(name: "Haven Games Project", manager: "Zel")
    @item_1 = Item.create!(name: "Gloomhaven", cost: 149, project_id: @project_1.id)
    @item_2 = Item.create!(name: "Frosthaven", cost: 149, project_id: @project_1.id)
  end

  it "Shows individual items and their project's name" do
    visit "/items/#{@item_1.id}"

    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_1.cost)
    expect(page).to have_content(@project_1.name)
  end
end
