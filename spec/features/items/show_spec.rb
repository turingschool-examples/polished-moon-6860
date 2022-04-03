require 'rails_helper'


RSpec.describe 'Item Show page' do
  it 'displays items name, cost and project owner' do
    project = Project.create!(name: 'Build4Kids', manager: 'Joe')
    item = project.items.create!(name: 'School', cost: '500')

    visit "/items/#{item.id}"

    expect(page).to have_content('School')
    expect(page).to have_content('500')
    expect(page).to have_content('Build4Kids')
  end
end
