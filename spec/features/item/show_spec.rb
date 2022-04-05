require 'rails_helper'

RSpec.describe 'the item show page' do
  it 'I see that items name and cost' do
    project_1 = Project.create!(name: "Downtown Library", manager: "Steve")
    item_1 = project_1.items.create!(name: "steel bars", cost: 14000)
    visit "/items/#{item_1.id}"
    expect(page).to have_content("#{item_1.name}")
    expect(page).to have_content("#{item_1.cost}")
    expect(page).to have_content("#{project_1.name}")
  end
end
