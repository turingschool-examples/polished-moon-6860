require 'rails_helper'

RSpec.describe 'Items show' do
  it "shows item name, cost, and project" do
    @project1= Project.create!(name: 'Big Project', manager: 'Timmy')
    @item1 = Item.create!(name: 'Hammer', cost: 11, project_id: @project1.id)

    visit "/items/#{@item1.id}"

    expect(page).to have_content(@item1.name)
    expect(page).to have_content(@item1.cost)
    expect(page).to have_content(@project1.name)
  end

end
