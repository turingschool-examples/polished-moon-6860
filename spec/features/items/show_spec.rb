require 'rails_helper'

RSpec.describe "item show" do
  before do
    @project1 = Project.create!(name: "Mine", manager: "Chris")
    @item1 = Item.create!(name: "CarTweet", cost: 30, project_id: @project1.id)
    @item2 = Item.create!(name: "WeWin", cost: 60, project_id: @project1.id)
  end

  it 'can show item, cost and project on Item show page' do
  visit "/items/#{@item1.id}"

  expect(page).to have_content(@item1.name)
  expect(page).to have_content(@item1.cost)
  expect(page).to have_content(@item1.project.name)
  end
end
