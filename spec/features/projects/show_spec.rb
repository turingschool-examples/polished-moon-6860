require 'rails_helper'

RSpec.describe 'projects show page' do
  it 'displays avg cost per item' do
    project = Project.create!(name: "Pencil Project", manager: "Billy")
    pencil = project.items.create!(name: "Pencil", cost: "50")
    eraser = project.items.create!(name: "Eraser", cost: "25")
    ink_pen = project.items.create!(name: "Ink Pen", cost: "100")

    visit "/projects/#{project.id}"
    expect(page).to have_content("58.33")
  end
end
