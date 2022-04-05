require 'rails_helper'

RSpec.describe 'project show page' do
  before (:each) do
    @project1 = Project.create!(name: "New House", manager: "Joe Smith")
    @project2 = Project.create!(name: "Ballpark", manager: "Fran Drescher")

    @item1 = @project1.items.create!(name: "Chair", cost: 34)
    @item2 = @project1.items.create!(name: "Bed frame", cost: 541)
    @item3 = @project1.items.create!(name: "Blackout curtains", cost: 65)
    @item4 = @project2.items.create!(name: "Field paint", cost: 50)
    @item5 = @project2.items.create!(name: "Chain fence", cost: 480)
    @item6 = @project2.items.create!(name: "Bleachers", cost: 750)
  end

  it 'shows the average cost per item needed for the project' do
    # require "pry"; binding.pry
    visit "/projects/#{@project1.id}"
    expect(page).to have_content(@project1.name)
    expect(page).to have_content(213.33)
    expect(page).not_to have_content(213.3333)
    expect(page).not_to have_content(@item2.name)

    visit "/projects/#{@project2.id}"
    expect(page).to have_content(@project2.name)
    expect(page).to have_content(426.67)
    expect(page).not_to have_content(426.66667)
    expect(page).not_to have_content(@item6.name)
  end
end
