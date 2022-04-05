require 'rails_helper'

RSpec.describe 'the Item show page' do
  before(:each) do
    @project = Project.create!(name: 'Alpha Omega', manager: 'Luke P')
    @item = @project.items.create!(name: 'Adamantium Tube', cost: 743)
  end

  it 'shows an items name and cost' do
    visit "/items/#{@item.id}"

    expect(page).to have_content(@item.name)
    expect(page).to have_content(@item.cost)
  end

  it 'shows what project the item belongs to' do
    visit "/items/#{@item.id}"

    expect(page).to have_content(@project.name)
  end
end
