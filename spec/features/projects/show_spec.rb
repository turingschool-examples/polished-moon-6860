require 'rails_helper'


RSpec.describe 'Project Show page' do
  it 'displays average cost per item for that project' do
    project = Project.create!(name: 'Build4Kids', manager: 'Joe')
    project2 = Project.create!(name: 'FeedTheHungry', manager: 'Pam')
    item1 = project.items.create!(name: 'CPU', cost: 3)
    item2 = project.items.create!(name: 'RAM', cost: 3)
    item3 = project.items.create!(name: 'HardDrive', cost: 1)
    item6 = project2.items.create!(name: 'Pea', cost: 2)
    item7 = project2.items.create!(name: 'Corn', cost: 3)
    item8 = project2.items.create!(name: 'Carrot', cost: 3)

    visit "/projects/#{project.id}"
    expect(page).to have_content("Average cost per item on project: 2.33")
    visit "/projects/#{project2.id}"
    expect(page).to have_content("Average cost per item on project: 2.67")
  end
end
