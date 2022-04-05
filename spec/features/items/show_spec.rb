require 'rails_helper'

RSpec.describe 'items show page' do
  before (:each) do
    @project = Project.create!(name: "New House", manager: "Joe Smith")
    @item1 = @project.items.create!(name: "chair", cost: 34)
    @item2 = @project.items.create!(name: "bed frame", cost: 340)
  end

  it 'shows the item name, cost and which project it belongs to' do
    visit "/items/#{@item1.id}"
    expect(page).to have_content("chair")
    expect(page).to have_content(34)
    expect(page).to have_content("New House")
    expect(page).not_to have_content("bed frame")
  end
end
