require 'rails_helper'

RSpec.describe 'the application show' do
  it "shows the application and all it's attributes" do
    project = Project.create!(name: "Lazer Makers", manager: "Mike Dao")
    item = project.items.create!(name: "Big Ass Lazer", cost: "12345")
    visit "/items/#{item.id}"
    expect(page).to have_content("Big Ass Lazer")
    expect(page).to have_content("12345")
    expect(page).to have_content("Lazer Makers")

  end
end
